<?php
/**
 * Email:zhaojunlike@gmail.com
 * Date: 7/8/2017
 * Time: 5:42 PM
 */

namespace app\admin\controller;


use think\Request;
use think\Session;

class Portal extends Base
{

    public function login()
    {
        Session::set("user_token", ['id' => 1, 'username' => 'admin']);
        if ($this->request->isPost()) {


        } else {
            return $this->fetch();
        }
    }

    public function getVerify()
    {

    }
}