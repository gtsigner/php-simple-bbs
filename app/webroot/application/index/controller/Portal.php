<?php
/**
 * Email:zhaojunlike@gmail.com
 * Date: 7/8/2017
 * Time: 5:42 PM
 */

namespace app\index\controller;


use app\common\model\User;
use app\common\tools\Utils;
use think\captcha\Captcha;
use think\captcha\CaptchaHelper;
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
                $this->result([], 500, "对不起,验证码错误", "JSON");
            }
            $username = $this->request->post("username", null, "trim");
            $password = $this->request->post('password', null, 'trim');

            $user = User::get([
                'username' => $username,
                'password' => Utils::encodeUserPassword($password, $username),
            ]);
            if (!$user) {
                $this->result([], 500, "对不起,用户名或者密码错误", "JSON");
            }
            //初始化admin
            $user->admin;
            $user->headPic;
            //钩子
            Hook::listen("user_login", $user);

            Session::set('user_token', $user->toArray());
            if (!is_null($user->admin) && $user->admin->is_root > 0) {
                $this->result(['url' => url('admin/index/index')], 200, '管理员,欢迎您回来,正在跳转到后台管理!', "JSON");
            } else {
                $this->result(['url' => url('index/index/index')], 200, '会员欢迎您,请您稍后!', "JSON");
            }
        } else {
            return $this->fetch();
        }
    }

    public function reg()
    {
        if ($this->request->isPost()) {
            $captcha = new Captcha((array)Config::get('captcha'));
            $verify_code = $this->request->post("verify_code", null, "trim");
            if (!$captcha->check($verify_code, 1) && Config::get('app_debug') !== true) {
                $this->result([], 500, "对不起,验证码错误", "JSON");
            }
            if (request()->request("password") !== request()->request('re_password')) {
                $this->result([], 500, "对不起,两次密码不一致", "JSON");
            }
            $data = [
                'username' => request()->request('username'),
                'nickname' => request()->request('nickname'),
                'password' => request()->request('password'),
                'level_score' => 0,
                'experience' => 0,
                'score' => 0,
            ];
            //
            $data['password'] = Utils::encodeUserPassword($data['password'], $data['username']);
            $user = new User($data);
            //用户
            $ret = $user->validate("user.add")->save($data);
            if (false === $ret) {
                $this->result([], 500, "对不起,注册失败. <span class='text-danger'>" . $user->getError() . "!!!</span>", "JSON");
            }

            //用户组
            $user->authGroup()->save(['group_id' => \config('SYSTEM_USER_SIGNUP_GROUP_ID')]);
            //钩子
            if (false !== $ret) {
                Hook::listen("user_reg", $user);
                $this->result([], 200, '恭喜您,注册成功!', "JSON");
            } else {
                $this->result([], 500, "对不起,注册失败. <span class='text-danger'>" . $user->getError() . "!!!</span>", "JSON");
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
        $captcha = new Captcha((array)Config::get('captcha'));
        return $captcha->entry(1);
    }

    public function getPostVerify()
    {
        $captcha = new CaptchaHelper();
        return $captcha->entry(10);
    }

    public function logout()
    {
        //钩子
        Hook::listen("user_logout", $this->mUser);
        Session::delete("user_token");
        $this->success("注销成功", url('portal/login'));
    }
}