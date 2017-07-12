<?php

namespace app\index\controller;


use app\common\model\BbsCategory;
use app\common\model\BbsPost;


class Index extends Auth
{
    public function index($category = 0)
    {
        $map = [];
        if ($category !== 0) {
            $map['category_id'] = $category;
        }
        $cate = BbsCategory::get($category);
        $data = null;
        if (!$cate) {
            //不存在分类
            $data = BbsPost::where([])->order('create_time DESC')->paginate($this->page_limit);
        } else {
            $data = $cate->posts()->where([])->order('create_time DESC')->paginate($this->page_limit);
        }
        $this->assign('page', $data->render());
        $this->assign('category', $cate);
        $this->assign('data_list', $data);
        return $this->fetch();
    }
}
