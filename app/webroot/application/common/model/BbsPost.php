<?php
/**
 * Email:zhaojunlike@gmail.com
 * Date: 7/10/2017
 * Time: 6:12 PM
 */

namespace app\common\model;


use think\Model;
use traits\model\SoftDelete;

class BbsPost extends Model
{
    use SoftDelete;
    protected $deleteTime = 'delete_time';

    public function category()
    {
        return $this->hasOne("bbs_category", 'id', 'category_id');
    }

    public function user()
    {
        return $this->hasOne("user", 'id', 'user_id');
    }

    public function comments()
    {
        return $this->hasMany('BbsComment', 'post_id', 'id');
    }

    public function getPositionTextAttr($val, $data)
    {
        $position = ['' => '无', 0 => 'X', 1 => '推荐', 2 => '置顶'];
        return $position[$data['position']];
    }
}