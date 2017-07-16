<?php
/**
 * Email:zhaojunlike@gmail.com
 * Date: 7/13/2017
 * Time: 10:11 AM
 */

namespace app\admin\controller\bbs;


use app\admin\controller\Auth;
use app\common\model\BbsComment;

class Comment extends Auth
{

    public function comments()
    {
        return $this->fetch();
    }

    public function changeStatus($id)
    {
        $post = BbsComment::get(['id' => $id]);
        $post['status'] = $post['status'] == 1 ? 0 : 1;
        $post->save();
        $this->success("调整状态成功");
    }

    public function getList()
    {
        $map = [];
        $dataList = model('bbs_comment')
            ->where($map)
            ->with(['user' => function ($query) {
                $query->field('id,username,nickname');
            }])
            ->with(['post' => function ($query) {
                $query->field('id,title,create_time');
            }])
            ->order('create_time DESC')
            ->paginate($this->page_limit);

        $data['data_list'] = $dataList;
        $this->result($data, 200, 'success', "JSON");
    }

    public function addEdit()
    {
        if ($this->request->request("method") === 'edit') {
            $post = Comment::get($this->request->request('id'));
            if (!$post) {
                $this->error("对不起,此数据不存在");
            }
            $post['category_id'] = $this->request->request('category_id', 0, 'intval');
            $post['sort'] = $this->request->request('sort', 0, 'intval');
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
        $ret = model('bbs_comment')->where($map)->delete();
        if ($ret) {
            $this->result([], 200, "删除成功", "JSON");
        } else {
            $this->result([], 500, "删除失败", "JSON");
        }
    }
}