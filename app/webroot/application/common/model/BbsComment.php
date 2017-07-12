<?php
/**
 * Email:zhaojunlike@gmail.com
 * Date: 7/12/2017
 * Time: 2:18 PM
 */

namespace app\common\model;


use think\Model;

class BbsComment extends Model
{

    public function comments()
    {
        return $this->hasMany('BbsComment', 'pid');
    }

    public function post()
    {
        return $this->hasOne("BbsPost", 'id', 'post_id');
    }

    public function user()
    {
        return $this->hasOne("User", 'id', 'uid');
    }

}