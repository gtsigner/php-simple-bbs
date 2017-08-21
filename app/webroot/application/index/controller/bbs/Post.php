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
use oeynet\addCaptcha\CaptchaHelper;
use think\Hook;
use voku\helper\AntiXSS;

class Post extends Auth
{
    public function push()
    {
        if ($this->request->isPost()) {
            $method = input('method');
            if ($method === 'add') {
                $cap = new CaptchaHelper();
                if (!$cap->check($this->request->request('verify_code'), 10) && true !== \think\Config::get('app_debug')) {
                    $this->error("对不起,验证码不正确");
                }
                $title = $this->request->request('title', '', 'htmlspecialchars');
                $content = $this->request->post('content', '', 'htmlspecialchars');
                $markdownCode = $this->request->post('md_content', '', 'htmlspecialchars');
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
                    'user_id' => $this->mUser['id'],
                    'content' => $content,
                    'create_time' => time(),
                    'md_content' => $markdownCode,
                    'status' => config('BBS_AUTH_STATUS_TRUE')
                ]);
                //发帖钩子
                Hook::listen("user_bbs_comment", $this->mUser, $post);

                if ($ret) {
                    $this->success("发帖成功");
                } else {
                    $this->error("发帖失败,{$post->getError()}");
                }
            } else {
                $this->editPost();
            }
        } else {
            return $this->fetch();
        }
    }


    /**
     * 提交评论
     */
    public function comment()
    {
        if (request()->isPost()) {
            $content = $this->request->post('postContent-html-code', '', 'htmlspecialchars');
            $markdownCode = $this->request->post('postContent-markdown-doc', '', 'htmlspecialchars');
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
                'to_uid' => 0,//at
                'post_id' => $post_id,
                'user_id' => $this->mUser['id'],
                'content' => $content,
                'create_time' => time(),
                'update_time' => time(),
                'md_content' => $markdownCode,
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

    /**
     * 编辑
     * @return mixed
     */
    public function editComment()
    {
        $id = input('id', 0, 'intval');
        $comment = BbsComment::get([
            'user_id' => $this->mUser['id'],
            'id' => $id,
        ]);
        if (false === $comment) {
            $this->error("对不起,未找到");
        }
        if (request()->isPost()) {
            $cap = new CaptchaHelper();
            if (!$cap->check($this->request->request('verify_code'), 10) && true !== \think\Config::get('app_debug')) {
                $this->error("对不起,验证码不正确");
            }
            $content = $this->request->post('postContent-html-code', '', 'htmlspecialchars');
            $markdownCode = $this->request->post('postContent-markdown-doc', '', 'htmlspecialchars');
            $antiXss = new AntiXSS();
            $content = $antiXss->xss_clean($content);

            $ret = $comment->save(['content' => $content, 'md_content' => $markdownCode, 'update_time' => time()]);
            //评论钩子
            Hook::listen("user_bbs_comment_update", $this->mUser, $comment);

            if ($ret) {
                $this->success("修改成功");
            } else {
                $this->error("操作失败,{$comment->getError()}");
            }
        } else {
            $this->assign('data', $comment);
            return $this->fetch();
        }
    }

    public function editPost()
    {
        $id = input('id', 0, 'intval');
        $data = BbsPost::get([
            'user_id' => $this->mUser['id'],
            'id' => $id,
        ]);
        if (!$data) {
            $this->error("对不起,未找到");
        }
        if (request()->isPost()) {
            $cap = new CaptchaHelper();
            if (!$cap->check($this->request->request('verify_code'), 10) && true !== \think\Config::get('app_debug')) {
                $this->error("对不起,验证码不正确");
            }
            $content = $this->request->post('postContent-html-code', '', 'htmlspecialchars');
            $title = $this->request->post('title', '', 'htmlspecialchars');
            $category_id = $this->request->post('category_id', $data['category_id'], 'intval');
            $markdownCode = $this->request->post('postContent-markdown-doc', '', 'htmlspecialchars');
            $antiXss = new AntiXSS();
            $content = $antiXss->xss_clean($content);

            $ret = $data->save([
                'title' => $title,
                'content' => $content,
                'md_content' => $markdownCode,
                'category_id' => $category_id,
                'update_time' => time()
            ]);
            //评论钩子
            Hook::listen("user_bbs_comment_update", $this->mUser, $data);

            if ($ret) {
                $this->success("修改成功");
            } else {
                $this->error("操作失败,{$data->getError()}");
            }
        } else {
            $this->assign('data', $data);
            $this->assign('form', ['method' => 'edit']);
            return $this->fetch('push');
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

        $comments = $data->comments()
            ->where(['status' => 1])
            ->paginate(10);

        $this->assign('comments', $comments);
        $this->assign('comments_page', $comments->render());
        $this->assign('category', $data->category);
        $this->assign('data', $data);

        return $this->fetch();
    }

    public function delete($id)
    {

    }
}