<?php
/**
 * Email:zhaojunlike@gmail.com
 * Date: 7/10/2017
 * Time: 7:12 PM
 */

namespace app\admin\controller\system;


use app\admin\controller\Auth;
use app\common\model\FriendLinks;

class Config extends Auth
{


    public function friendLinks()
    {

        return $this->fetch();
    }

    /**
     * 增删
     * Email:zhaojunlike@gmail.com
     */
    public function addEditFriendLinks()
    {
        if ($this->request->isPost()) {
            //填加或者修改
            $method = $this->request->request('method');
            $ret = false;
            if ($method === 'add') {
                $link = new  FriendLinks($_POST);
                $ret = $link->allowField(true)->save();
            }
            if ($method === 'edit') {
                $link = FriendLinks::get($this->request->request('id'));
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

    public function getFriendLinks()
    {
        $map = [];
        $userList = model('friend_links')
            ->where($map)
            ->paginate($this->page_limit);

        $data['data_list'] = $userList;

        $this->result($data, 200, 'success', "JSON");
    }

    public function delFriendLinks($id)
    {
        $map = [];
        if (is_array($id)) {
            //批量
        } else {
            $map['id'] = $id;
        }
        $ret = model('friend_links')->where($map)->delete();
        if ($ret) {
            $this->result([], 200, "删除成功", "JSON");
        } else {
            $this->result([], 500, "删除失败", "JSON");
        }
    }


}