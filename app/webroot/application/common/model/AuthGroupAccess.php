<?php
/**
 * Email:zhaojunlike@gmail.com
 * Date: 7/10/2017
 * Time: 11:56 AM
 */

namespace app\common\model;


use think\Model;

class AuthGroupAccess extends Model
{

    public function authGroups()
    {
        return $this->hasOne('group', 'id', 'group_id');
    }

    public function authRules()
    {
        return $this->hasOne('auth_rule', 'id', 'auth_id');
    }
}