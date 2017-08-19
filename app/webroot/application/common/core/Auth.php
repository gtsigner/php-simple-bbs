<?php

namespace app\common\core;

use app\common\model\AuthGroup;
use app\common\model\AuthGroupAccess;
use app\common\model\AuthRule;
use app\common\model\AuthUserGroup;
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
    private $currentRule = [];

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

    public function getRule()
    {
        return $this->currentRule;
    }

    /**
     * Email:zhaojunlike@gmail.com
     * @param $rule
     * @param $user
     * @return mixed
     */
    public function checkAuth($rule, $user)
    {
        $rule = implode("/", $rule);
        $rule = strtolower($rule);
        //1.检测系统是否配置规则
        $systemRule = model('auth_rule')->where(['rule' => $rule])->find();
        if (!$systemRule && !isset($user['admin']['is_root']) && $user['admin']['is_root'] !== 1) {
            return self::$AUTH_CODES['denial'];
        }
        $this->currentRule = $systemRule;
        //如果是超级管理员
        if (isset($user['admin']['is_root']) && $user['admin']['is_root'] === 1) {
            return self::$AUTH_CODES['success'];
        }

        //2.检查用户组
        $userAuthGroups = AuthUserGroup::where(['uid' => $user['id']])->with('authGroup')->select();
        $userAuthRules = [];
        //游客,给游客权限
        if ($user['id'] === -1) {
            //http://192.168.99.100/index/index/index/
            $viewGroup = AuthGroup::get(config('SYSTEM_DEFAULT_VIEWER_GROUP_ID'));
            $tmpRules = $viewGroup->rules;
            $tmpRules = explode(",", $tmpRules);
            $rules = AuthRule::all($tmpRules);
            foreach ($rules as $rule) {
                array_push($userAuthRules, $rule);
            }
        }
        foreach ($userAuthGroups as $authGroup) {
            //
            $tmpRules = $authGroup->auth_group->rules;
            $tmpRules = explode(",", $tmpRules);
            $rules = AuthRule::all($tmpRules);
            foreach ($rules as $rule) {
                array_push($userAuthRules, $rule);
            }
        }
        $userAuthRules = collection($userAuthRules)->toArray();
        if (false === array_search($systemRule['id'], array_column($userAuthRules, "id"))) {
            return self::$AUTH_CODES['denial'];
        }
        //6.验证
        return self::$AUTH_CODES['success'];
    }

    //拒绝服务
    protected function denialService($rule, $user)
    {
        return self::$AUTH_CODES['denial'];
    }

    //记录访问
    protected function recordService($rule, $user)
    {
        //记录

        return self::$AUTH_CODES['record'];
    }
}