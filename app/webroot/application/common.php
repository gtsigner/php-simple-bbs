<?php
// +----------------------------------------------------------------------
// | ThinkPHP [ WE CAN DO IT JUST THINK ]
// +----------------------------------------------------------------------
// | Copyright (c) 2006-2016 http://thinkphp.cn All rights reserved.
// +----------------------------------------------------------------------
// | Licensed ( http://www.apache.org/licenses/LICENSE-2.0 )
// +----------------------------------------------------------------------
// | Author: 流年 <liu21st@gmail.com>
// +----------------------------------------------------------------------

// 应用公共文件

function getSystemVersion()
{

}

function getUserLevel($user)
{
//    $userLevel = \app\common\model\UserLevel::all();
//    $current = $userLevel[0];
//    foreach ($userLevel as $index => $level) {
//        if ($level->score >= $user['score']) {
//            $current = $userLevel[$index - 1];
//            break;
//        }
//    }
//    dump($current);
//    exit();
    $level = \app\common\model\UserLevel::where("score", "<=", $user['score'])->order('level DESC')->find();
    return $level['name'];
}

function getRealHeadPath($path)
{
    if (!isset($path['headPic']['path'])) {
        return null;
    }
    return "/upload/head/{$path['headPic']['path']}";
}

function getStaticVersion()
{
    return mt_rand(0, 10000) * mt_rand(0, 10000);
}

function checkDateDefault($date)
{
    if ($date === '1970-01-01 08:00:00') {
        return null;
    } else {
        return $date;
    }
}