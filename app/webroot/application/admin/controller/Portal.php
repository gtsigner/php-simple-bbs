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
use think\captcha\CaptchaHelper;
use think\Config;
use think\Db;
use think\Request;
use think\Session;

class Portal extends Base
{

    public function login()
    {
        if ($this->request->isPost()) {
            $captcha = new Captcha((array)Config::get('captcha'));
            $verify_code = $this->request->post("verify_code", null, "trim");
            if (!$captcha->check($verify_code, 1)) {
                $this->error("对不起,验证码错误");
            }
            $username = $this->request->post("username", null, "trim");
            $password = $this->request->post('password', null, 'trim');

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
        $captcha = new CaptchaHelper();
        return $captcha->entry(1);
    }

    public function logout()
    {
        Session::delete("user_token");
        $this->success("注销成功", url('portal/login'));
    }
}