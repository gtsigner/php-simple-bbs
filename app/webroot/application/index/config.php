<?php
/**
 * Email:zhaojunlike@gmail.com
 * Date: 7/11/2017
 * Time: 4:40 PM
 */
return [
    'view_replace_str' => [
        '__PUBLIC__' => '/',
        '__STATIC__' => '/static',
        '__THEME__' => '/theme/segmentfault'
    ],
    // 默认跳转页面对应的模板文件
    'dispatch_success_tmpl' => APP_PATH . 'tpl' . DS . 'dispatch_jump.tpl',
    'dispatch_error_tmpl' => APP_PATH . 'tpl' . DS . 'dispatch_jump.tpl',
];