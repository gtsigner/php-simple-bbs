<?php

namespace app\index\controller;


use app\common\model\BbsCategory;
use app\common\model\BbsPost;


class Index extends Auth
{
    public function index($category = 0, $keywords = "")
    {
        $map = [];
        if ($category !== 0) {
            $map['category_id'] = $category;
        }
        if ($keywords !== '') {
            $map['title'] = ['like', "%{$keywords}%"];
        }
        $cate = BbsCategory::get($category);
        $data = null;
        if ($cate) {
            $map['category_id'] = $category;
        }
        $data = model('bbs_post')
            ->where($map)
            ->withCount("comments")
            ->order('position DESC,create_time DESC,sort ASC')
            ->paginate($this->page_limit);
        $this->assign('page', $data->render());
        $this->assign('category', $cate);
        $this->assign('data_list', $data);

        return $this->fetch();
    }
}
