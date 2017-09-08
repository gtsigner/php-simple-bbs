<?php
/**
 * Created by PhpStorm.
 * User: zhaojunlike
 * Date: 8/23/2017
 * Time: 6:59 PM
 */

namespace app\common\service;


class UserNotice
{

    public function sendNotice($uid, $content)
    {
        $notice = new \app\common\model\UserNotice();
        $notice['uid'] = $uid;
        $notice['create_time'] = time();
        $notice['content'] = $content;
        $notice['status'] = 0;
        return $notice->save();
    }
}