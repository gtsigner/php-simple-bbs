<?php

namespace app\common\core;

use app\common\model\AuthGroup;
use app\common\model\AuthGroupAccess;
use app\common\model\User;
use think\Request;

/**
 * Email:zhaojunlike@gmail.com
 * Date: 7/8/2017
 * Time: 5:32 PM
 */
class Auth
{
    static private $_instance;
    static public $AUTH_CODES = [
        'not_config' => 1,
        'not_found' => 2,
        'denial' => -1,
        'record' => 3,
        'success' => 0,
        'denial_method' => 4,
    ];

    private function __construct()
    {
    }


    /**
     * Email:zhaojunlike@gmail.com
     * @return Auth
     */
    static public function Instance()
    {
        if (!self::$_instance) {
            self::$_instance = new self();
        }
        return self::$_instance;
    }

    /**
     * Email:zhaojunlike@gmail.com
     * @param $rule
     * @param $uid
     * @return mixed
     */
    public function checkAuth($rule, $uid)
    {
        $rule = implode("/", $rule);
        $rule = strtolower($rule);
        //1.检测系统是否配置规则
        $systemRule = model('auth_rule')->where(['rule' => $rule])->find();
        if (!$systemRule) {
            return self::$AUTH_CODES['denial'];
        }

        //2.检查用户组
        $authGroupAccess = AuthGroupAccess::get(['uid' => $uid]);
        if (!$authGroupAccess) {
            return self::$AUTH_CODES['denial'];
        }

        //3.获取所有规则检查规则是否在
        $group = AuthGroup::get([
            'id' => $authGroupAccess->group_id,
            'status' => 1
        ]);
        if (!$group) {
            //进行正则查询

            return self::$AUTH_CODES['denial'];
        }
        $rules = explode(',', $group->rules);
        if (!array_search($systemRule->id, $rules)) {
            return self::$AUTH_CODES['denial'];
        }

        //4.验证回调GroupAccess的callback
        $rc = new \ReflectionClass(self::class);
        if ($rc->hasMethod($authGroupAccess['callback'])) {
            return call_user_func(array(self::class, $authGroupAccess['callback']), $rule, $uid);
        }

        //5.验证方法
        if (!empty($authGroupAccess['method']) && Request::instance()->method() !== strtoupper($authGroupAccess['method'])) {
            return self::$AUTH_CODES['denial_method'];
        }

        //6.验证
        return self::$AUTH_CODES['success'];
    }

    //拒绝服务
    protected function denialService($rule, $uid)
    {
        var_dump($rule, $uid);
        return self::$AUTH_CODES['denial'];
    }

    //记录访问
    protected function recordService($rule, $uid)
    {
        //记录

        return self::$AUTH_CODES['record'];
    }
}