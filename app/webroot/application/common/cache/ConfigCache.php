<?php
/**
 * Email:zhaojunlike@gmail.com
 * Date: 7/14/2017
 * Time: 3:44 PM
 */

namespace app\common\cache;


use app\common\model\SystemConfig;
use think\Cache;
use think\Config;

class ConfigCache extends Cacher
{
    private static $instance = null;

    static public function Instance()
    {
        if (null === self::$instance) {
            self::$instance = new self();
        }
        return self::$instance;
    }

    public function updateCache()
    {
        $config = SystemConfig::where(['status' => 1])->column('value', 'key');
        $config = collection($config)->toArray();
        Cache::set('system_config', $config);
        return true;
    }

    public function initCache()
    {
        $config = Cache::get('system_config');
        if (false === $config) {
            $config = SystemConfig::where(['status' => 1])->column('value', 'key');
            $config = collection($config)->toArray();
            Cache::set('system_config', $config);
        }
        Config::set($config);
    }
}