<?php
/**
 * Email:zhaojunlike@gmail.com
 * Date: 7/10/2017
 * Time: 5:09 PM
 */

namespace app\admin\controller\bbs;


use app\admin\controller\Auth;
use app\common\model\BbsCategory;


class Category extends Auth
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
        $postCount = model('bbs_post')->where(['category_id' => $id])->count();
        if (0 < $postCount) {
            $this->error("对不起,栏目下有帖子,请先删除帖子");
        }
        $ret = model('bbs_category')->where($map)->delete();
        if ($ret) {
            $this->result([], 200, "删除成功", "JSON");
        } else {
            $this->result([], 500, "删除失败", "JSON");
        }
    }

    public function addCategory()
    {
        if ($this->request->isPost()) {
            $category = new BbsCategory();
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
    public function getCategory()
    {
        $data = BbsCategory::where([])->order('sort ASC')->select();
        $this->result($data, 200, "success", "JSON");
    }

    public function addEdit()
    {
        if ($this->request->isPost()) {
            //填加或者修改
            $method = $this->request->request('method');
            $ret = false;
            if ($method === 'add') {
                $link = new  BbsCategory($_POST);
                $ret = $link->allowField(true)->save();
            }
            if ($method === 'edit') {
                $link = BbsCategory::get($this->request->request('id'));
                $ret = $link->data($_POST)->allowField(true)->save();
            }
            if (false === $ret) {
                $this->result(null, 500, '操作失败', "JSON");
            } else {
                $this->result(null, 200, '操作成功', "JSON");
            }
        } else {
            return $this->fetch();
        }
    }
}