<?php
/**
 * Email:zhaojunlike@gmail.com
 * Date: 7/12/2017
 * Time: 2:18 PM
 */

namespace app\common\model;


use think\Model;
use traits\model\SoftDelete;

class BbsComment extends Model
{
    use SoftDelete;
    protected $deleteTime = 'delete_time';

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
        return $this->hasOne("User", 'id', 'user_id');
    }

    public function atUser()
    {
        return $this->hasOne("User", 'id', 'to_uid');
    }

}