<?php
/**
 * Email:zhaojunlike@gmail.com
 * Date: 7/11/2017
 * Time: 6:00 PM
 */

namespace app\index\controller\user;


use app\common\service\UserService;
use app\index\controller\Auth;

class Profile extends Auth
{

    public function index()
    {
        if ($this->request->isPost()) {
            //Save Profiles

        }
        return $this->fetch();
    }

    public function resetPwd()
    {
        if ($this->request->isPost()) {
            if (!$this->checkVerify(1)) {
                $this->error("验证码错误");
            }
            $newPwd = $this->request->request('password');
            $reNewPwd = $this->request->request('re_password');
            if ($reNewPwd !== $newPwd) {
                $this->error("对不起,两次密码不正确");
            }
            $ret = UserService::resetPassword($this->mUser['username'], $this->request->request('old_password'), $newPwd);
            if (false === $ret) {
                $this->error("对不起,重置密码失败." . UserService::getError());
            }
            $this->success("重置密码成功");
        } else {
            return $this->fetch();
        }
    }
}