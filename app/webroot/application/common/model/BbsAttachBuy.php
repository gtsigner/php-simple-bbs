<?php
/**
 * Email:zhaojunlike@gmail.com
 * Date: 7/14/2017
 * Time: 5:56 PM
 */

namespace app\common\model;


use think\Model;

class BbsAttachBuy extends Model
{

    public function user()
    {
        return $this->hasOne("user", 'id', 'uid');
    }

    public function attach()
    {
        return $this->hasOne("bbs_attach", 'id', 'attach_id');
    }

    public function file()
    {
        return $this->hasOne("bbs_file", 'id', 'attach_id');
    }
}