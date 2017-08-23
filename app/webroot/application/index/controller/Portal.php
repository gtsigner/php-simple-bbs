<?php
/**
 * Email:zhaojunlike@gmail.com
 * Date: 7/8/2017
 * Time: 5:42 PM
 */

namespace app\index\controller;


use app\common\model\User;
use app\common\tools\Utils;
use oeynet\addCaptcha\CaptchaHelper;
use think\captcha\Captcha;
use think\Config;
use think\Hook;
use think\Session;

class Portal extends Base
{

    public function login()
    {
        if ($this->request->isPost()) {
            $captcha = new Captcha((array)Config::get('captcha'));
            $verify_code = $this->request->post("verify_code", null, "trim");
            if (!$captcha->check($verify_code, 1) && Config::get('app_debug') !== true) {
                $this->error("对不起,验证码错误");
            }
            $username = $this->request->post("username", null, "trim");
            $password = $this->request->post('password', null, 'trim');

            $user = User::get([
                'username' => $username,
                'password' => Utils::encodeUserPassword($password, $username),
            ]);
            if (!$user) {
                $this->error("对不起,用户名或者密码错误");
            }
            //钩子
            Hook::listen("user_login", $user);
            //session
            Session::set('user_token', $user->toArray());
            $this->success('会员欢迎您,请您稍后!');
        } else {
            return $this->fetch();
        }
    }

    public function signup()
    {
        if ($this->request->isPost()) {
            $captcha = new Captcha((array)Config::get('captcha'));
            $verify_code = input("verify_code", null, "trim");
            if (!$captcha->check($verify_code, 1) && Config::get('app_debug') !== true) {
                $this->error("对不起,验证码错误");
            }
            if (request()->request("password") !== request()->request('re_password')) {
                $this->error("对不起,两次密码不一致");
            }
            $data = [
                'username' => request()->request('username'),
                'nickname' => request()->request('username') . '_' . rand(0, 9999),
                'email' => request()->request('email'),
                'password' => request()->request('password'),
                'pwd_salt' => '',//暂时不用
                'reg_time' => time(),
                'reg_ip' => request()->ip(),
                'status' => \config('USER_SIGNUP_STATUS')
            ];
            //
            $data['password'] = Utils::encodeUserPassword($data['password'], $data['username']);
            $user = new User($data);
            //用户
            $ret = $user->validate("user.add")->save($data);
            if (false === $ret) {
                $this->error("对不起,注册失败. <span class='text-danger'>" . $user->getError() . "</span>");
            }

            //用户组
            $user->authGroup()->save(['group_id' => \config('SYSTEM_USER_SIGNUP_GROUP_ID')]);
            //钩子
            if (false !== $ret) {
                Hook::listen("user_reg", $user);
                $this->success('恭喜您,注册成功!');
            } else {
                $this->error("对不起,注册失败. <span class='text-danger'>" . $user->getError() . "!!!</span>");
            }
        } else {
            return $this->fetch();
        }
    }


    public function findPwd()
    {

    }

    public function getVerify()
    {
        $captcha = new CaptchaHelper();
        return $captcha->entry(1);
    }

    public function getPostVerify()
    {
        $captcha = new CaptchaHelper();
        return $captcha->entry(10);
    }


}