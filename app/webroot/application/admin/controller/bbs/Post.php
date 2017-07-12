<?php
/**
 * Email:zhaojunlike@gmail.com
 * Date: 7/10/2017
 * Time: 7:10 PM
 */

namespace app\admin\controller\bbs;


use app\admin\controller\Auth;
use function foo\func;

class Post extends Auth
{

    public function postList()
    {
        return $this->fetch();
    }

    public function getList()
    {
        $map = [];
        $dataList = model('bbs_post')
            ->where($map)
            ->withCount(['comments' => function ($query) {
                $query->where('status', 1);
            }])
            ->with("category")
            ->with(['user' => function ($query) {
                $query->field('id,username,nickname');
            }])
            ->order('create_time DESC')
            ->paginate($this->page_limit);
        $data['data_list'] = $dataList;
        $this->result($data, 200, 'success', "JSON");
    }

    public function delete($id)
    {
        $map = [];
        if (is_array($id)) {
        } else {
            $map['id'] = $id;
        }
        $ret = model('bbs_post')->where($map)->delete();
        if ($ret) {
            $this->result([], 200, "删除成功", "JSON");
        } else {
            $this->result([], 500, "删除失败", "JSON");
        }
    }
}