<?php
/**
 * Email:zhaojunlike@gmail.com
 * Date: 7/14/2017
 * Time: 3:46 PM
 */

namespace app\common\cache;


class Cacher
{
    private static $instance = null;

    static public function Instance()
    {
        if (null === self::$instance) {
            self::$instance = new self();
        }
        return self::$instance;
    }
}