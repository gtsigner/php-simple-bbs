<?php

namespace app\common\cache;

use app\common\model\AuthRule;
use Oeynet\Helper\TreeHelper;

/**
 * Email:zhaojunlike@gmail.com
 * Date: 7/10/2017
 * Time: 2:28 PM
 */
class AuthCache
{
    private static $instance = null;

    static public function Instance()
    {
        if (null === self::$instance) {
            self::$instance = new self();
        }
        return self::$instance;
    }

    static public function getAuthRules($auth_type = null, $module = null)
    {
        $map = [
            'status' => 1
        ];
        if (!empty($auth_type)) {
            $map['auth_type'] = $auth_type;
        }
        if (!empty($module)) {
            $map['module'] = $module;
        }

        $rules = AuthRule::where($map)->field("*,pid as parent")->order('sort ASC,id DESC')->select();
        $rules = collection($rules)->toArray();
        return $rules;
    }


    /**
     * Email:zhaojunlike@gmail.com
     * @param null $auth_type
     * @param null $module
     * @return TreeHelper
     */
    static public function getAuthRulesTree($auth_type = null, $module = null)
    {
        $data = self::getAuthRules($auth_type, $module);
        $helper = new TreeHelper();
        $helper->load($data);
        return $helper;
    }
}