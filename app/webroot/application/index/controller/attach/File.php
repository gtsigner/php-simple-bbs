<?php
/**
 * Email:zhaojunlike@gmail.com
 * Date: 7/11/2017
 * Time: 5:00 PM
 */

namespace app\index\controller\attach;


use app\common\model\BbsAttachBuy;
use app\common\model\BbsFile;
use app\common\model\User;
use app\common\service\UserService;
use app\index\controller\Auth;

class File extends Auth
{

    public function index()
    {
        $map = [
            'status' => 1
        ];
        $bbsFiles = BbsFile::where($map)
            ->paginate($this->page_limit);
        $this->assign('page', $bbsFiles->render());
        $this->assign('data_list', $bbsFiles);
        return $this->fetch();
    }

    public function download($id = 0)
    {
        $file = BbsFile::get(['id' => $id, 'status' => 1]);
        if (!$file) {
            $this->error("对不起,附件数据不存在");
        } else {
            //检查是否购买
            $attachBuy = BbsAttachBuy::get([
                'uid' => $this->mUser['id'],
                'attach_id' => $id
            ]);
            if (!$attachBuy) {
                $this->error("请先兑换此附件后再进行下载");
            }

            if (!file_exists($this->writeDecode($file['local_path']))) {
                $this->error("哇呕,此文件已经被管理员删除了,附件文件不存在");
            }
            // http headers
            header('Content-Type: application-x/force-download');
            header('Content-Disposition: attachment; filename="' . basename($file['local_path']) . '"');
            ob_end_clean();
            return readfile($this->writeDecode($file['local_path']));
        }
    }

    private function writeDecode($str)
    {
        return $str;
    }


    public function buy($id)
    {
        //file
        $attach = BbsFile::get(['id' => $id, 'status' => 1]);
        if (!$attach) {
            $this->error("附件已经不存在了");
        }
        $attachBuy = BbsAttachBuy::get([
            'uid' => $this->mUser['id'],
            'attach_id' => $id
        ]);
        if ($attachBuy) {
            $this->success("您已经兑换过附件,您可以直接到<label class='label label-primary'>我的附件</label>进行附件下载");
        } else {
            $user = User::get(['id' => $this->mUser['id']]);
            if ($user->score < $attach['need_score']) {
                $this->error('对不起,您的积分不足');
            }
            //扣分
            UserService::DecUserScore($user['id'], "兑换附件，扣除积分", $attach['need_score']);
            //添加
            $buy = new BbsAttachBuy();
            $buy['uid'] = $this->mUser['id'];
            $buy['attach_id'] = $id;
            $buy['create_time'] = time();
            $buy['pay_amount'] = $attach['need_score'];
            $buyRet = $buy->save();
            $user->lock(false);
            $this->success("恭喜您,兑换附件成功");
        }
    }


}