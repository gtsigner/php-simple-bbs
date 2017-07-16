<?php
/**
 * Email:zhaojunlike@gmail.com
 * Date: 7/10/2017
 * Time: 7:10 PM
 */

namespace app\admin\controller\bbs;


use app\admin\controller\Auth;
use app\common\model\BbsFile;

class File extends Auth
{

    public function index()
    {
        if ($this->request->isPost()) {

        } else {
            return $this->fetch();
        }
    }

    public function delete($id)
    {
        $map = [];
        if (is_array($id)) {
        } else {
            $map['id'] = $id;
        }
        //search
        $bbsFile = BbsFile::get($map);
        @unlink($bbsFile['local_path']);
        //@rmdir()
        $ret = BbsFile::where($map)->delete();

        if ($ret) {
            $this->result([], 200, "删除成功", "JSON");
        } else {
            $this->result([], 500, "删除失败", "JSON");
        }
    }

    public function addCategory()
    {
        if ($this->request->isPost()) {
            $category = new BbsFile();
            $ret = $category->insert([
                'title' => $this->request->request('title'),
                'sort' => $this->request->request('sort'),
                'mark' => $this->request->request('mark'),
            ]);
            if ($ret) {
                $this->result([], 200, '新增成功!', "JSON");
            } else {
                $this->result([], 500, '新增失败', "JSON");
            }
        }
    }

    /**
     * api get
     * Email:zhaojunlike@gmail.com
     */
    public function getList()
    {
        $map = [];

        $dataList = BbsFile::where($map)
            ->order('sort ASC,create_time DESC')
            ->paginate($this->page_limit);
        $data['data_list'] = $dataList;;

        $this->result($data, 200, "success", "JSON");
    }

    public function changeStatus($id)
    {
        $post = BbsFile::get(['id' => $id]);
        $post['status'] = $post['status'] == 1 ? 0 : 1;
        $post->save();
        $this->success("调整状态成功");
    }

    public function addEdit()
    {
        if ($this->request->isPost()) {
            //填加或者修改
            $method = $this->request->request('method');
            $ret = false;
            if ($method === 'add') {
                $link = new  BbsFile($_POST);
                $ret = $link->allowField(true)->save();
            }
            if ($method === 'edit') {
                $link = BbsFile::get($this->request->request('id'));
                unset($_POST['create_time']);
                $_POST['update_time'] = time();
                $ret = $link->data($_POST)->allowField(true)->save();
            }
            if (false === $ret) {
                $this->result(null, 500, '操作失败', "JSON");
            } else {
                $this->result(null, 200, "操作{$method}成功", "JSON");
            }
        } else {
            return $this->fetch();
        }
    }

}