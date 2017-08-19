<?php
/**
 * Email:zhaojunlike@gmail.com
 * Date: 7/10/2017
 * Time: 11:28 AM
 */

namespace app\common\tools;


class Utils
{
    static protected $enCode = '!@#123..123';

    static public function encodeUserPassword($password, $salt)
    {
        return md5(base64_encode($password) . $salt . self::$enCode);
    }

    static public function checkUserPassword($passwordStr, $realPassword, $salt)
    {
        if (self::encodeUserPassword($passwordStr, $salt) === $realPassword) {
            return true;
        }
        return false;
    }
}