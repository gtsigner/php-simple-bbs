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
}