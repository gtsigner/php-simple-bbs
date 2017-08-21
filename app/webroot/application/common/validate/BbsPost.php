<?php
/**
 * Email:zhaojunlike@gmail.com
 * Date: 7/12/2017
 * Time: 1:53 PM
 */

namespace app\common\validate;


use think\Validate;

class BbsPost extends Validate
{
    protected $rule = [
        'title' => 'require|min:4',
        'md_content' => 'require|min:100',
        'user_id' => 'require',
        'category_id' => 'require',
    ];

    protected $message = [
        'title.min' => '帖子标题最少4个字符',
        'title.require' => '帖子题目必须填写',

        'md_content.require' => '内容必须填写',
        'md_content.min' => '内容最小100个字符',

        'user_id.require' => '请登陆后发帖',
        'category_id.require' => '必须选择发表栏目',

    ];
}