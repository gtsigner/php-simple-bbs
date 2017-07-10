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
                'sort' => $this->request->request('sort', 0),
                'mark' => $this->request->request('mark'),
            ]);
            if ($ret) {
                $this->result([], 200, '新增成功!', "JSON");
            } else {
                $this->result([], 500, '新增失败', "JSON");
            }
        }
    }

    public function getCategory()
    {
        $data = BbsCategory::where([])->order('sort ASC')->select();
        $this->result($data, 200, "success", "JSON");
    }
}