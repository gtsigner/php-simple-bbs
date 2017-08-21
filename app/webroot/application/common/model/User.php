<?php
/**
 * Email:zhaojunlike@gmail.com
 * Date: 7/10/2017
 * Time: 11:18 AM
 */

namespace app\common\model;


use think\Model;

class User extends Model
{

    public function admin()
    {
        return $this->hasOne("admin", 'uid');
    }

    public function authGroup()
    {
        return $this->hasMany('auth_user_group', 'uid', 'id');
    }

    public function userGroup()
    {
        return $this->belongsToMany('auth_group', '\\app\\common\\model\\AuthUserGroup', 'group_id', 'uid');
    }

    public function headPic()
    {
        return $this->hasOne('bbs_picture', 'id', 'head_pic_id');
    }

    public function userProfile()
    {
        return $this->hasOne('user_profile', 'uid', 'id');
    }
}