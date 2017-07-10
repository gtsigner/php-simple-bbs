<?php

namespace app\common\cache;

use app\common\model\AuthRule;

/**
 * Email:zhaojunlike@gmail.com
 * Date: 7/10/2017
 * Time: 2:28 PM
 */
class AuthCache
{

    static public function getAuthRules($auth_type, $module = null)
    {
        $map = [
            'auth_type' => 1,
        ];
        if (!empty($module)) {
            $map['module'] = $module;
        }
        $rules = AuthRule::all($map);
        dump($rules);
    }
}