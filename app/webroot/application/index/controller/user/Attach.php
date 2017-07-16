<?php
/**
 * Email:zhaojunlike@gmail.com
 * Date: 7/14/2017
 * Time: 5:55 PM
 */

namespace app\index\controller\user;


use app\common\model\BbsAttachBuy;
use app\index\controller\Auth;

class Attach extends Auth
{


    public function index()
    {
        $map = [
            'uid' => $this->mUser['id'],
        ];
        $bbsFiles = BbsAttachBuy::where($map)
            ->with('file')
            ->order('create_time DESC')
            ->paginate($this->page_limit);

        $this->assign('page', $bbsFiles->render());
        $this->assign('data_list', $bbsFiles);
        return $this->fetch();
    }
}