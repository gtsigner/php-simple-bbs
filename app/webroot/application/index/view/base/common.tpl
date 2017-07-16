<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="keywords" content="{$_rule.title|default=config('WEB_SITE_KEYWORDS')}">
    <meta name="description" content="{$_rule.title|default=config('WEB_SITE_DESC')}">
    <title>{$_rule.title|default=config('WEB_SITE_TITLE')}-首页</title>

    <script src="__STATIC__/requirejs/require.js"></script>
    <script data-main="css!bootstrapCss" src="__THEME__/js/app.v1.js?v={:getStaticVersion()}"></script>
    <link rel="stylesheet" href="__STATIC__/bootstrap/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="__THEME__/css/app.css">
    <script>
        requirejs.config({
            baseUrl: '/static',
            paths: {
                jquery: 'jquery/dist/jquery.min',
                bootstrap: 'bootstrap/dist/js/bootstrap.min',
                vue: 'vue/dist/vue.min',
                axios: 'axios/dist/axios.min',
                layer: 'layer/build/layer',
                //Css
                appCss: '../theme/admin/scss/app',
                bootstrapCss: 'bootstrap/dist/css/bootstrap.min',
                layerCss: 'layer/build/skin/default/layer',
                wangEditor: 'wangEditor/release/wangEditor.min',
                wangEditorCss: 'wangEditor/release/wangEditor.min',
                animateCss: 'animate.css/animate.min',
                vuePager: 'vuejs-paginate/dist/index',
                ajaxUploader: 'AjaxUploader/SimpleAjaxUploader.min'
            },
            map: {
                '*': {
                    'css': 'require-css/css' // or whatever the path to require-css is
                }
            },
            shim: {
                bootstrap: {
                    deps: ['jquery', 'css!animateCss']
                },
                layer: {
                    deps: ['jquery', 'css!layerCss']
                },
                wangEditor: {
                    deps: ['css!wangEditorCss'],
                }
            }
        });
        requirejs(['jquery', 'bootstrap'], function ($, bootstrap) {
            $.support.transition = true;
        });
    </script>
    <style>
        .main-box {
            box-shadow: 5px 5px 10px #ddd;
        }
    </style>
</head>
<body>
<div class="container main-box">
    {block name='adv'}
        <div class="row header-adv show">
            <img style="width:100%;height: 200px"
                 src="http://bpic.588ku.com/back_pic/00/05/05/995625dd8ca6ffd.jpg!ww800"
                 alt="">
        </div>
        <div class="row system-total">
            <ul class="list-inline">
                <li class="item">游客人数：<span>{$_total.current_viewer}</span></li>
                <li>在线人数： <span>{$_total.current_online}</span></li>
                <li>会员总数：<span>{$_total.user_count}</span></li>
                <li>今日发帖：<span>{$_total.today_post_count}</span></li>
                <li>帖子总数： <span>{$_total.post_count}</span></li>
            </ul>
        </div>
    {/block}

    {block name='header'}
        <div class="row">
            <div class="row">

            </div>
            <div class="row">
                <div class="col-xs-3">
                    <img src="" alt="">
                </div>
            </div>
        </div>
        <nav class="navbar navbar-default">
            <div class="container-fluid">
                <!-- Brand and toggle get grouped for better mobile display -->
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle collapsed" data-toggle="collapse"
                            data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    <a class="navbar-brand" href="{:url('/')}">
                        <img class="header-logo" src="http://101vv.com/Public/images/logo.png" alt="">
                    </a>
                </div>

                <!-- Collect the nav links, forms, and other content for toggling -->
                <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                    <ul class="nav navbar-nav">
                        {volist name="_menu" id="vo"}
                        {empty name="vo.children"}
                            <li><a href="{:url($vo['rule'])}">{$vo.title}</a></li>
                        {else/}
                            <ul class="nav navbar-nav">
                                <li class="dropdown">
                                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button"
                                       aria-haspopup="true" aria-expanded="false">{$vo.title} <span
                                                class="caret"></span></a>
                                    <ul class="dropdown-menu">
                                        {volist name="vo.children" id="voc"}
                                            <li><a href="{:url($voc['rule'])}">{$voc.title}</a></li>
                                        {/volist}
                                    </ul>
                                </li>
                            </ul>
                        {/empty}
                        {/volist}
                    </ul>
                    <ul class="nav navbar-nav navbar-right">
                        <li class="dropdown">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button"
                               aria-haspopup="true"
                               aria-expanded="false"
                               style="padding: 5px;">
                                <img style="height: 40px;width: 40px;overflow: hidden;border-radius: 100%;"
                                     src="{$_user|getRealHeadPath|default='/theme/common/images/header.png'}"
                                     alt="">
                                {$_user.username|default='游客请登录'}
                                <span class="caret"></span>
                            </a>
                            {eq name="_user.id" value="-1"}
                                <ul class="dropdown-menu user-drop-menu">
                                    <li><a href="{:url('index/portal/login')}">登陆</a></li>
                                    <li><a href="{:url('index/portal/reg')}">注册</a></li>
                                </ul>
                            {else/}
                                <ul class="dropdown-menu user-drop-menu animated animated-quick fadeInRight">
                                    <li><a class="text-center text-success">欢迎您，{$_user.nickname}</a></li>
                                    <li><a>积分: <span class="text-success">{$_user.score}</span></a></li>
                                    <li><a href="{:url('index/user.profile/index')}">个人资料</a></li>
                                    <li><a href="{:url('index/user.attach/index')}">我的附件</a></li>
                                    <li><a href="{:url('index/user.profile/resetPwd')}">修改密码</a></li>
                                    <li role="separator" class="divider"></li>
                                    <li><a href="{:url('portal/logout')}">注销登陆</a></li>
                                </ul>
                            {/eq}
                        </li>
                    </ul>
                    <form class="navbar-form navbar-right" method="get" action="{:url('index/index')}">
                        <div class="form-group">
                            <input type="text" class="form-control" placeholder="关键词" name="keywords">
                        </div>
                        <button type="submit" class="btn btn-primary">搜贴</button>
                    </form>

                </div><!-- /.navbar-collapse -->
            </div><!-- /.container-fluid -->
        </nav>
    {/block}
    {block name="category"}
        <div class="row category-list">
            <ul class="list-group list-inline">
                <li></li>
                {volist name="_category" id="vo"}
                {eq name="vo.id" value="$category.id"}
                    <li class="category-item active">
                        <a href="{:url('index/index/index',['category'=>$vo['id']])}">{$vo.title}</a>
                    </li>
                {else/}
                    <li class="category-item">
                        <a href="{:url('index/index/index',['category'=>$vo['id']])}">{$vo.title}</a>
                    </li>
                {/eq}

                {/volist}
            </ul>
        </div>
    {/block}
    <div class="main-container">
        {block name='body'}

        {/block}
    </div>
    {block name='footer'}
        <div class="footer">
            <div class="row friend-link-box">
                <div class="row">
                    <ul class="list-inline">
                        <li class="friend-link-head">
                            友情链接：
                        </li>
                        {volist name="_friend_links" id='vo'}
                            <li class="friend-link-item">
                                <a href="{$vo.url}">{$vo.title}</a>
                            </li>
                        {/volist}
                    </ul>
                </div>
            </div>
        </div>
    {/block}
</div>
</body>
</html>