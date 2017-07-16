<?php
/**
 * Email:zhaojunlike@gmail.com
 * Date: 7/16/2017
 * Time: 2:48 PM
 */

namespace app\common\model;


use think\Model;

class UserScoreLog extends Model
{

    public function user()
    {
        return $this->hasOne("user", 'id', 'uid');
    }

}