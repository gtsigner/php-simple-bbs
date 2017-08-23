<?php
/**
 * Created by PhpStorm.
 * User: zhaojunlike
 * Date: 8/21/2017
 * Time: 11:14 AM
 */

namespace app\index\controller\bbs;


use app\common\model\BbsComment;
use app\common\model\BbsPost;
use app\common\model\User;
use app\index\controller\Auth;
use think\Hook;

class Comment extends Auth
{

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
            if ($had > 0 && config('app_debug') === false) {
                $this->error("每篇文章,您只能评论一次");
            }
            $post = BbsPost::get(['id' => $post_id]);
            if (false === $post) {
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
            $data['user'] = $this->mUser;
            $data['post'] = $post;
            $data['comment'] = $comment;
            Hook::listen("user_bbs_comment", $this->mUser, $data);

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
    public function push()
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
}