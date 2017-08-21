<?php
/**
 * Email:zhaojunlike@gmail.com
 * Date: 7/10/2017
 * Time: 11:28 AM
 */

namespace app\common\tools;


use think\File;

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

    /**
     * @param $content
     * @param $path
     * @return bool|File
     */
    static public function saveBase642Img($content, $path)
    {
        if (preg_match('/^(data:\s*image\/(\w+);base64,)/', $content, $result)) {
            $type = $result[2];
            $file['type'] = "images/" . $type;
            $file['ext'] = $type;
            $file['save_path'] = $path . DS . date('Ymd') . DS;
            if (!is_dir($file['save_path'])) {
                mkdir($file['save_path'], 0666);
            }
            $file['data'] = base64_decode(str_replace($result[1], '', $content));
            $file['name'] = md5($file['data']) . ".{$file['ext']}";
            if (!file_put_contents($file['save_path'] . $file['name'], $file['data'])) {
                return false;
            }
            unset($file['data']);
            $FILE = new File($file['save_path'] . $file['name']);
            $file['size'] = $FILE->getSize();
            $file['saveName'] = $file['save_path'] . $file['name'];
            $file['build_path'] = DS . date('Ymd') . DS . $file['name'];

            $FILE->setUploadInfo($file);
            return $FILE;
        } else {
            return false;
        }
    }
}