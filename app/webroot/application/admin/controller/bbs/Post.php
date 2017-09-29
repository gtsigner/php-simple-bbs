<?php
/**
 * Email:zhaojunlike@gmail.com
 * Date: 7/10/2017
 * Time: 7:10 PM
 */

namespace app\admin\controller\bbs;


use app\admin\controller\Auth;
use app\common\model\BbsPost;
use function foo\func;

class Post extends Auth
{

    public function postList()
    {
        return $this->fetch();
    }

    public function changeStatus($id)
    {
        $post = BbsPost::get(['id' => $id]);
        $post['status'] = $post['status'] == 1 ? 0 : 1;
        $post->save();
        $this->success("调整状态成功");
    }

    public function getList()
    {
        $map = [];
        $category = input('search.category', 0, 'intval');
        if ($category > 0) {
            $map['category_id'] = $category;
        }
        $dataList = model('bbs_post')
            ->where($map)
            ->withCount(['comments' => function ($query) {
                //$query->where('status', 1);
            }])
            ->force(false)
            ->with("category")
            ->with(['user' => function ($query) {
                $query->field('id,username,nickname');
            }])
            ->order('position DESC,sort ASC,create_time DESC')
            ->paginate($this->page_limit);

        foreach ($dataList->getCollection() as &$item) {
            //$item = $item->toArray();
            $item['position_text'] = $item->position_text;
            //echo $item->position_text;
        }
        $data['data_list'] = $dataList;
        $this->result($data, 200, 'success', "JSON");
    }

    public function addEdit()
    {
        if ($this->request->request("method") === 'edit') {
            $post = BbsPost::get($this->request->request('id'));
            if (!$post) {
                $this->error("对不起,此贴不存在");
            }
            $post['category_id'] = $this->request->request('category_id', 0, 'intval');
            $post['sort'] = $this->request->request('sort', 0, 'intval');
            $post['user_id'] = input('user_id', 0, 'intval');
            $post['position'] = input('position', '', 'intval');
            $post->save();
            $this->success("保存成功");
        }
    }

    public function del($id)
    {
        $map = [];
        if (is_array($id)) {
            $map['id'] = $id;
        } else {
            $map['id'] = $id;
        }
        $ret = BbsPost::destroy($map, true);
        if ($ret) {
            $this->result([], 200, "删除成功", "JSON");
        } else {
            $this->result([], 500, "删除失败", "JSON");
        }
    }
}