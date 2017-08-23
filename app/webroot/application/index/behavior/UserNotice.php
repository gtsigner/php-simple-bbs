<?php
/**
 * Created by PhpStorm.
 * User: zhaojunlike
 * Date: 8/23/2017
 * Time: 6:52 PM
 */

namespace app\index\behavior;


class UserNotice
{
    public function run(&$user)
    {

    }

    /**
     * 评论
     * @param $user
     * @param $post
     * @param $comment
     */
    public function userBbsComment(&$user, &$data)
    {
        //给用户发送通知消息
        $userNotice = new \app\common\service\UserNotice();
        $content = "用户<a href=''>{$user['username']}</a>评论了您的文章<a>{$data['post']['title']}</a>";
        $userNotice->sendNotice($user['id'], $content);
    }
}