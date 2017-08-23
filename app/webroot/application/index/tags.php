<?php
// +----------------------------------------------------------------------
// | ThinkPHP [ WE CAN DO IT JUST THINK ]
// +----------------------------------------------------------------------
// | Copyright (c) 2006~2016 http://thinkphp.cn All rights reserved.
// +----------------------------------------------------------------------
// | Licensed ( http://www.apache.org/licenses/LICENSE-2.0 )
// +----------------------------------------------------------------------
// | Author: liu21st <liu21st@gmail.com>
// +----------------------------------------------------------------------

// 应用行为扩展定义文件
return [
//    'user_login' => [
//        'app\\index\\behavior\\UserScore',
//    ],
//    'user_reg' => [
//        'app\\index\\behavior\\UserScore',
//    ],
//    'user_bbs_post' => [
//        'app\\index\\behavior\\UserScore',
//    ],
##用户评论钩子
    'user_bbs_comment' => [
        //'app\\index\\behavior\\UserScore',
        'app\\index\\behavior\\UserNotice',
    ],
//    'user_logout' => [
//        'app\\index\\behavior\\UserScore',
//    ],
//    'user_bbs_view' => [
//        'app\\index\\behavior\\UserScore',
//    ]
];
