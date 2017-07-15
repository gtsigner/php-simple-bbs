<?php
/**
 * Email:zhaojunlike@gmail.com
 * Date: 7/12/2017
 * Time: 6:03 PM
 */

namespace app\common\behavior;


use app\common\cache\ConfigCache;
use app\common\model\SystemConfig;
use think\Cache;
use think\Config;

class ConfigBehavior
{

    public function run()
    {
        $cacher = ConfigCache::Instance();
        $cacher->initCache();
    }
}