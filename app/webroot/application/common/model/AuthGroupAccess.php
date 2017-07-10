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

    public function group()
    {
        return $this->hasOne('group', 'group_id');
    }
}