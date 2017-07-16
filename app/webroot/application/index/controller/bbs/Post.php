<?php
/**
 * Email:zhaojunlike@gmail.com
 * Date: 7/11/2017
 * Time: 4:59 PM
 */

namespace app\index\controller\bbs;


use app\common\model\BbsCategory;
use app\common\model\BbsComment;
use app\common\model\BbsPost;
use app\common\model\User;
use app\index\controller\Auth;
use think\captcha\CaptchaHelper;
use think\Hook;
use voku\helper\AntiXSS;

class Post extends Auth
{

    public function post()
    {
        if ($this->request->isPost()) {
            $cap = new CaptchaHelper();
            if (!$cap->check($this->request->request('verify_code'), 10) && true !== \think\Config::get('app_debug')) {
                $this->error("对不起,验证码不正确");
            }
            $title = $this->request->request('title', '', 'htmlspecialchars');
            $content = $this->request->post('content', '', 'htmlspecialchars');
            $category_id = $this->request->request('category_id', 0, 'intval');
            if (false === BbsCategory::get(['id' => $category_id])) {
                $this->error("对不起,请选择发表栏目");
            }

            if (false === User::get(['id' => $this->mUser['id'], 'status' => 1])) {
                $this->error("对不起,您没有发帖权限");
            }

            $antiXss = new AntiXSS();
            $content = $antiXss->xss_clean($content);
            $post = new BbsPost();
            $ret = $post->validate(true)->save([
                'title' => $title,
                'category_id' => $category_id,
                'uid' => $this->mUser['id'],
                'content' => $content,
                'create_time' => time(),
                'status' => \think\Config::get('BBS_AUTH_STATUS_TRUE')
            ]);
            //发帖钩子
            Hook::listen("user_bbs_comment", $this->mUser, $post);

            if ($ret) {
                $this->success("发帖成功");
            } else {
                $this->error("发帖失败,{$post->getError()}");
            }
        }
    }

    public function comment()
    {
        if (request()->isPost()) {
            $cap = new CaptchaHelper();
            if (!$cap->check($this->request->request('verify_code'), 10) && true !== \think\Config::get('app_debug')) {
                $this->error("对不起,验证码不正确");
            }
            $content = $this->request->post('content', '', 'htmlspecialchars');
            $post_id = $this->request->request('post_id', 0, 'intval');
            if (false === BbsPost::get(['id' => $post_id])) {
                $this->error("对不起,请选择回复的帖子");
            }
            if (false === User::get(['id' => $this->mUser['id'], 'status' => 1])) {
                $this->error("对不起,您没有回帖权限");
            }
            $antiXss = new AntiXSS();
            $content = $antiXss->xss_clean($content);
            $comment = new BbsComment();
            $ret = $comment->insert([
                'post_id' => $post_id,
                'uid' => $this->mUser['id'],
                'content' => $content,
                'create_time' => time(),
                'status' => \think\Config::get('BBS_AUTH_COMMENT_STATUS_TRUE'),
            ]);

            //评论钩子
            Hook::listen("user_bbs_comment", $this->mUser, $comment);

            if ($ret) {
                $this->success("回帖成功");
            } else {
                $this->error("回帖失败,{$comment->getError()}");
            }
        }
    }

    public function detail($id)
    {
        //cache
        $cacheKey = "looked_{$id}_{$this->mUser['id']}";

        $data = BbsPost::get($id);

        Hook::listen("user_bbs_view", $this->mUser, $data);

        if (!cookie($cacheKey)) {
            $data->setInc('view_count', 1);
        }
        cookie($cacheKey, 1);
        $comments = $data->comments()->where(['status' => 1])->paginate(10);
        $this->assign('comments', $comments);
        $this->assign('comments_page', $comments->render());
        $this->assign('category', $data->category);
        $this->assign('data', $data);
        return $this->fetch();
    }
}