<?php

namespace app\common\validate;

use think\Validate;

/**
 * Email:zhaojunlike@gmail.com
 * Date: 7/11/2017
 * Time: 2:57 PM
 */
class User extends Validate
{
    protected $rule = [
        'username' => 'require|unique:user|max:25|alphaNum',
        'password' => 'require|length:32',
    ];

    protected $message = [
        'username.require' => '用户名必须',
        'username.unique' => '此用户名称已经注册',
        'username.alpha' => '用户名只能包含英文字母和数字的组合',
        'password.require' => '密码必须',
    ];

}