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
use think\Route;

Route::rule('post/:id', 'Index/bbs.post/detail', 'POST');

return [
    '__pattern__' => [
        'name' => '\w+',
    ],
    'post/:id' => 'index/bbs.post/detail',

    //分类
    '[category]' => [
        ':category' => [
            'Index/index/index',
            ['method' => 'get'],
            ['id' => '\d+']
        ],
        '' => 'index/index/index',
    ],
    '[user]' => [
        ':id' => [
            'user.profile/index',
            ['method' => 'get'],
            ['id' => '\d+']
        ],
        '' => 'user.profile/index',
    ],
    //附件
    '[attach]' => [
        ':id' => [
            'index/index/index',
            ['method' => 'get'],
            ['id' => '\d+']
        ],
        '' => 'index/attach.file/index',
    ],
];
