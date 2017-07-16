<?php
/**
 * Email:zhaojunlike@gmail.com
 * Date: 7/12/2017
 * Time: 6:03 PM
 */

namespace app\index\behavior;


use app\admin\controller\user\User;
use app\common\cache\ConfigCache;
use app\common\model\SystemConfig;
use app\common\service\UserService;
use think\Cache;
use think\Config;

class UserScore
{

    public function run(&$user)
    {


    }

    public function userLogin(&$user)
    {
        $this->incUserScore("{$user['id']}_posts_score", "用户今日首次登陆积分", 1, 5, $user, null);
    }

    public function userReg(&$user)
    {

    }

    public function userBbsPost(&$user, &$post)
    {
        $this->incUserScore("{$user['id']}_posts_score", "用户发布帖子获取积分", 5, 5, $user, $post);

    }

    //评论
    public function userBbsComment(&$user, &$comment)
    {

        $this->incUserScore("{$user['id']}_comments_score", "用户回复帖子获取积分", 20, 2, $user, $comment);
    }

    public function userBbsView(&$users, &$post)
    {
        //var_dump($users, $post);
    }

    private function incUserScore($cacheKey, $logMsg, $maxCount, $scoreCount, $user, $data)
    {
        $hist = Cache::store('redis')->get($cacheKey);
        $timeNow = time();
        if (!$hist) {
            UserService::IncUserScore($user['id'], $logMsg, $scoreCount);
            Cache::store('redis')->set($cacheKey, "{$timeNow}_1");
            return true;
        }
        //如果存在
        $hist = explode("_", $hist);
        if (($timeNow - $hist[0]) >= (24 * 60 * 60)) {
            UserService::IncUserScore($user['id'], $logMsg, $scoreCount);
            Cache::store('redis')->set($cacheKey, "{$timeNow}_1");
            return true;
        }
        if (($timeNow - $hist[0]) <= (24 * 60 * 60) && $hist[1] < $maxCount) {
            UserService::IncUserScore($user['id'], $logMsg, $scoreCount);
            $hist[1]++;
            Cache::store('redis')->set($cacheKey, "{$hist[0]}_{$hist[1]}");
            return true;
        }
    }
}