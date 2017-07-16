<?php

namespace app\admin\controller;

use think\Controller;

class Index extends Auth
{
    public function index()
    {
        return $this->fetch();
    }
}
