<?php
/**
 * Created by PhpStorm.
 * User: zhaojunlike
 * Date: 8/19/2017
 * Time: 2:52 PM
 */

namespace app\index\controller\user;


use app\index\controller\Auth;
use think\Hook;
use think\Session;

class User extends Auth
{

    public function logout()
    {
        //钩子
        Hook::listen("user_logout", $this->mUser);
        Session::delete("user_token");
        $this->success("注销成功", url('portal/login'));
    }

    public function getNotice()
    {
        $noticeList = model('user_notice')
            ->where(['uid' => $this->mUser['id']])
            ->order('status DESC,create_time DESC')
            ->field('id,create_time,content,status')
            ->paginate($this->page_limit);

        return json([
            'msg' => 'success',
            'code' => 1,
            'data' => $noticeList
        ], 200);

    }

    public function notice()
    {
        $noticeList = model('user_notice')
            ->where(['uid' => $this->mUser['id']])
            ->order('status DESC,create_time DESC')
            ->field('id,create_time,content,status')
            ->paginate($this->page_limit);

        $this->assign('page', $noticeList->render());
        $this->assign('data_list', $noticeList);
        return $this->fetch();
    }
}