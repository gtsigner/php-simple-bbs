<?php
/**
 * Email:zhaojunlike@gmail.com
 * Date: 7/10/2017
 * Time: 11:57 AM
 */

namespace app\common\model;


use think\Model;

class AuthGroup extends Model
{

    //获取access
    public function accesses()
    {
        return $this->hasMany("auth_group_access", 'group_id', 'id');
    }

    public function users()
    {
        return $this->hasMany("auth_user_group", 'group_id', 'id');
    }

    public function getRules($module)
    {
        $rules = explode(',', $this->rules);
        return AuthRule::all($rules);
    }
}