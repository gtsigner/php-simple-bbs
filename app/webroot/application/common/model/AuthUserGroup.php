<?php
/**
 * Email:zhaojunlike@gmail.com
 * Date: 7/15/2017
 * Time: 7:26 PM
 */

namespace app\common\model;


use think\Model;

class AuthUserGroup extends Model
{

    public function authGroup()
    {
        return $this->hasOne("auth_group", 'id', 'group_id');
    }
}