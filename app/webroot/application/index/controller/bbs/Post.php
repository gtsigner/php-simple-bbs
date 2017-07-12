<?php
/**
 * Email:zhaojunlike@gmail.com
 * Date: 7/11/2017
 * Time: 4:59 PM
 */

namespace app\index\controller\bbs;


use app\admin\controller\bbs\Category;
use app\common\model\BbsCategory;
use app\common\model\BbsPost;
use app\index\controller\Auth;
use think\captcha\CaptchaHelper;
use voku\helper\AntiXSS;

class Post extends Auth
{
    public function index()
    {


    }

    public function post()
    {
        if ($this->request->isPost()) {
            $cap = new CaptchaHelper();
            if (!$cap->check($this->request->request('verify_code'), 10) && true !== \think\Config::get('app_debug')) {
                $this->error("对不起,验证码不正确");
            }
            $title = $this->request->request('title', '', 'htmlspecialchars');
            $content = $this->request->post('content', '', 'htmlspecialchars');
            $category_id = $this->request->request('category_id', 0, 'intval');
            if (false === BbsCategory::get(['id' => $category_id])) {
                $this->error("对不起,请选择发表栏目");
            }

            $antiXss = new AntiXSS();
            $content = $antiXss->xss_clean($content);
            $post = new BbsPost();
            $ret = $post->validate(true)->save([
                'title' => $title,
                'category_id' => $category_id,
                'uid' => $this->mUser['id'],
                'content' => $content,
                'create_time' => time(),
            ]);
            if ($ret) {
                $this->success("发帖成功");
            } else {
                $this->error("发帖失败,{$post->getError()}");
            }
        }
    }

    public function search()
    {
        return $this->fetch();
    }

    public function detail($id)
    {
        $data = BbsPost::get($id);
        $this->assign('category', $data->category);
        $this->assign('data', $data);
        return $this->fetch();
    }
}