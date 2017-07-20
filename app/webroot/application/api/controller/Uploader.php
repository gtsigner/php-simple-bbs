<?php
/**
 * Email:zhaojunlike@gmail.com
 * Date: 7/13/2017
 * Time: 7:12 PM
 */

namespace app\api\controller;


use app\common\model\BbsFile;
use app\common\model\BbsPicture;
use app\common\model\User;
use think\Config;
use think\Controller;
use think\Session;

class Uploader extends Controller
{
    /**
     * upload
     * Email:zhaojunlike@gmail.com
     * @param $type
     */
    public function upload($type = 'file')
    {
        // 获取表单上传文件 例如上传了001.jpg
        $file = request()->file('up_file');
        // 移动到框架应用根目录/public/uploads/ 目录下
        if (!$file) {
            $this->result([], 500, "上传失败,请检查上传文件");
        }
        $savePath = Config::get("storage_path.{$type}");
        $info = $file->validate([])->rule('md5')->move($savePath);
        if ($info) {
            $entity = [
                'status' => 0,
                'download_count' => 0,
                'create_time' => time(),
                'title' => $info->getInfo('name'),
                'size' => $info->getInfo('size'),
                'ext' => $info->getExtension(),
                'type' => $info->getInfo('type'),
                'local_path' => $info->getPathname(),
                'path' => $info->getSaveName(),
                'md5' => $info->md5(),
                'path_type' => $type,
            ];
            $saveRet = BbsFile::create($entity)->save();
            $this->result($entity, 200, "上传成功,{$saveRet}");
        } else {
            $this->result([], 500, "上传失败,请检查上传文件,{$file->getError()}");
        }
    }


    public function upHeadImg()
    {
        $token = Session::get('user_token');
        if (!$token || $token['id'] <= 0) {
            $this->error("对不起,您没有权限操作");
        }
        // 获取表单上传文件 例如上传了001.jpg
        $file = request()->file('up_file');
        // 移动到框架应用根目录/public/uploads/ 目录下
        if (!$file) {
            $this->result([], 500, "上传失败,请检查上传文件");
        }
        $savePath = Config::get("storage_path.head_path");
        $info = $file->validate([
            'size' => 1024 * 1024 * 1,
            'ext' => 'jpg,png,jpeg,gif'
        ])->rule('md5')->move($savePath);
        if ($info) {
            $entity = [
                'status' => 1,
                'download_count' => 0,
                'create_time' => time(),
                'title' => $info->getInfo('name'),
                'size' => $info->getInfo('size'),
                'ext' => $info->getExtension(),
                'type' => $info->getInfo('type'),
                'local_path' => $info->getPathname(),
                'path' => $info->getSaveName(),
                'md5' => $info->md5(),
                'uid' => $token['id']
            ];
            $pic = new BbsPicture();
            $ret = $pic->insertGetId($entity);
            if (!$ret) {
                $this->result([], 500, "上传失败,请稍后重试");
            }
            $user = User::get(['id' => $token['id']]);
            $user->save(['head_pic_id' => $ret]);
            unset($entity['local_path']);
            $entity['id'] = $ret;
            $entity['path'] = "/upload/head/{$entity['path']}";
            Session::set('user_token', $user);
            $this->result($entity, 200, "上传成功,正在更新您的头像");
        } else {
            $this->result([], 500, "上传失败,请保证您得头像文件在2M以内,仅支持png,jpg,jpeg,gif格式,{$file->getError()}");
        }
    }

    public function uploadEditorImg()
    {
        $token = Session::get('user_token');
        if (!$token || $token['id'] <= 0) {
            $this->error("对不起,您没有权限操作");
        }
        // 获取表单上传文件 例如上传了001.jpg
        $file = request()->file('editormd-image-file');
        // 移动到框架应用根目录/public/uploads/ 目录下
        if (!$file) {
            $this->result([], 500, "上传失败,请检查上传文件");
        }
        $savePath = Config::get("storage_path.picture");
        $info = $file->validate([
            'size' => 1024 * 1024 * 5,
            'ext' => 'jpg,png,jpeg,gif'
        ])->rule('md5')->move($savePath);
        if ($info) {
            $entity = [
                'status' => 1,
                'download_count' => 0,
                'create_time' => time(),
                'title' => $info->getInfo('name'),
                'size' => $info->getInfo('size'),
                'ext' => $info->getExtension(),
                'type' => $info->getInfo('type'),
                'local_path' => $info->getPathname(),
                'path' => $info->getSaveName(),
                'md5' => $info->md5(),
                'uid' => $token['id'],
                'pic_type' => input('pic_type')
            ];
            $pic = new BbsPicture();
            $ret = $pic->insertGetId($entity);
            if (!$ret) {
                $this->result([], 500, "上传失败,请稍后重试");
            }
            $user = User::get(['id' => $token['id']]);
            $user->save(['head_pic_id' => $ret]);
            unset($entity['local_path']);
            $entity['id'] = $ret;
            $entity['path'] = "/upload/head/{$entity['path']}";
            Session::set('user_token', $user);
            return json_encode([
                'success' => 1,
                'url' => 0
            ]);
        } else {
            return json_encode([
                'success' => 0,
                'url' => 0
            ]);
        }
    }

    //进度
    public function uploadProgress()
    {

    }
}