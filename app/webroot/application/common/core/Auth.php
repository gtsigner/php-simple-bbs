<?php

namespace app\common\core;
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
        'success' => 0
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

    public function checkAuth(array $rule, $uid)
    {
        $rule = implode("/", $rule);
        $rule = strtolower($rule);
        $systemRule = model('auth_rule')->where(['rule' => $rule])->find();
        if (!$systemRule) {
            return self::$AUTH_CODES['denial'];
        }


        return self::$AUTH_CODES['success'];
    }

    //拒绝服务
    protected function denialService(array $rule, $uid)
    {
        return self::$AUTH_CODES['DENIAL'];
    }

    //记录访问
    protected function recordService(array $rule, $uid)
    {
        //记录

        return self::$AUTH_CODES['record'];
    }
}