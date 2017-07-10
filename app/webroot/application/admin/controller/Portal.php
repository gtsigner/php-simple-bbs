<?php
/**
 * Email:zhaojunlike@gmail.com
 * Date: 7/8/2017
 * Time: 5:42 PM
 */

namespace app\admin\controller;


use app\common\model\User;
use app\common\tools\Utils;
use think\captcha\Captcha;
use think\Config;
use think\Db;
use think\Request;
use think\Session;

class Portal extends Base
{

    public function login()
    {
        Session::set("user_token", ['id' => 1, 'username' => 'admin']);
        if ($this->request->isPost()) {
            $username = $this->request->post("username");
            $password = $this->request->post('password');
            $user = User::get([
                'username' => $username,
                'password' => Utils::encodeUserPassword($password, $username),
            ]);
            if (!$user) {
                $this->error("对不起，用户名或者密码错误");
            }
            if (is_null($user->admin) || $user->admin->is_root <= 0) {
                $this->error("对不起,您没有权限访问", url('index/index/index'));
            }
            Session::set('user_token', $user->toArray());
            $this->success("登陆成功，请您稍后", url('admin/index/index'));
        } else {
            return $this->fetch();
        }
    }

    public function getVerify()
    {
        $captcha = new Captcha((array)Config::get('captcha'));
        return $captcha->entry(1);
    }
}