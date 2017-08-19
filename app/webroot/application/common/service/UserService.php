<?php
/**
 * Email:zhaojunlike@gmail.com
 * Date: 7/11/2017
 * Time: 6:51 PM
 */

namespace app\common\service;


use app\common\model\User;
use app\common\model\UserScoreLog;
use app\common\tools\Utils;
use function foo\func;

class UserService
{

    static protected $errLogs;

    /**
     * 重置密码
     * Email:zhaojunlike@gmail.com
     * @param $username
     * @param $oldPassword
     * @param $newPassword
     * @return bool
     */
    static public function resetPassword($username, $oldPassword, $newPassword)
    {


        $user = User::get(['username' => $username, 'password' => Utils::encodeUserPassword($oldPassword, $username)]);
        if (!$user) {
            self::$errLogs = "原密码错误";
            return false;
        }
        $user['password'] = Utils::encodeUserPassword($newPassword, $username);
        if ($user->save() === false) {
            self::$errLogs = $user->getError();
            return false;
        } else {
            return true;
        }
    }


    static public function getError()
    {
        $log = self::$errLogs;
        self::$errLogs = '';
        return $log;
    }


    static public function IncUserScore($uid, $msg, $count)
    {
        model('user')->where(['id' => $uid])->setInc('score', $count);
        model('user')->where(['id' => $uid])->setInc('experience', $count);
        $log = new UserScoreLog([
            'uid' => $uid,
            'msg' => $msg,
            'count' => $count,
            'use_type' => 1,
            'ip' => request()->ip(),
            'create_time' => time()
        ]);
        $log->save();
    }

    static public function DecUserScore($uid, $msg, $count)
    {
        model('user')->where(['id' => $uid])->setDec('score', $count);
        $log = new UserScoreLog([
            'uid' => $uid,
            'msg' => $msg,
            'count' => $count,
            'use_type' => 1,
            'ip' => request()->ip(),
            'create_time' => time()
        ]);
        $log->save();
    }
}