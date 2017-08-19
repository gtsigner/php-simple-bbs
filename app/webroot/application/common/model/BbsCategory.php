<?php
/**
 * Email:zhaojunlike@gmail.com
 * Date: 7/10/2017
 * Time: 5:54 PM
 */

namespace app\common\model;


use think\Model;

class BbsCategory extends Model
{

    public function posts()
    {
        return $this->hasMany("bbs_post", 'category_id');
    }
}