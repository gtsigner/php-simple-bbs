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
}