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
                $title = $this->request->request('title');
                $markdownCode = input('md_content');
                $category_id = $this->request->request('category_id', 0, 'intval');
                if (false === BbsCategory::get(['id' => $category_id])) {
                    $this->error("对不起,请选择发表栏目");
                }
                if (false === User::get(['id' => $this->mUser['id'], 'status' => 1])) {
                    $this->error("对不起,您没有发帖权限");
                }
                $post = new BbsPost();
                $ret = $post->validate(true)->save([
                    'title' => $title,
                    'category_id' => $category_id,
                    'user_id' => $this->mUser['id'],
                    'create_time' => time(),
                    'md_content' => $markdownCode,
                    'status' => config('BBS_AUTH_STATUS_TRUE')
                ]);
                //发帖钩子
                Hook::listen("user_bbs_comment", $this->mUser, $post);

                if ($ret) {
                    $this->success("发帖成功", url("index/bbs.post/detail", ['id' => $post->getLastInsID()]));
                } else {
                    $this->error("发帖失败,{$post->getError()}");
                }
            } else {
                $this->editPost();
            }
        } else {
            $bbsPost = new BbsPost();
            $bbsPost['category_id'] = null;
            $this->assign('data', $bbsPost->toArray());
            return $this->fetch();
        }
    }


    /**
     * 提交评论
     */
    public function comment()
    {
        if (request()->isPost()) {

            $markdownCode = input('md_content');
            $post_id = input('post_id');

            //每个文章只能评论一次
            $had = model('bbs_comment')->where(['user_id' => $this->mUser['id'], 'post_id' => $post_id, 'to_uid' => 0])->count();
            if ($had > 0) {
                $this->error("每篇文章,您只能评论一次");
            }

            if (false === BbsPost::get(['id' => $post_id])) {
                $this->error("对不起,请选择回复的帖子");
            }
            if (false === User::get(['id' => $this->mUser['id'], 'status' => 1])) {
                $this->error("对不起,您没有回帖权限");
            }
            $comment = new BbsComment();
            $ret = $comment->insert([
                'to_uid' => 0,//at
                'post_id' => $post_id,
                'user_id' => $this->mUser['id'],
                'create_time' => time(),
                'update_time' => time(),
                'md_content' => $markdownCode,
                'status' => config('BBS_AUTH_COMMENT_STATUS_TRUE'),
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
            $markdownCode = input('md_content');
            $ret = $comment->save(['md_content' => $markdownCode, 'update_time' => time()]);
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
            if (!$cap->check(input('verify_code'), 10) && true !== config('app_debug')) {
                $this->error("对不起,验证码不正确");
            }
            $title = input('title');
            $category_id = input('category_id', $data['category_id'], 'intval');
            $markdownCode = input('md_content');
            $ret = $data->save([
                'title' => $title,
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
        if (!$data) {
            $this->error("文章被偷走了");
        }
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
        $this->_rule['keywords'] = $data['title'];
        $this->_rule['desc'] = $data['title'];
        $this->_rule['title'] = $data['title'] . ' ' . config('WEB_SITE_TITLE');
        return $this->fetch();
    }

    public function delete($id)
    {
        $bbsPost = BbsPost::get($id);
        if ($bbsPost) {
            $bbsPost->delete();
        }
        $this->success("删除成功", url('/'));
    }
}