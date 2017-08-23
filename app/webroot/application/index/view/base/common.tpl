<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv=X-UA-Compatible content="IE=edge,chrome=1">
    <meta name="renderer" content="webkit">
    <meta name="keywords" content="{$_rule.keywords|default=config('WEB_SITE_KEYWORDS')}">
    <meta name="description" content="{$_rule.desc|default=config('WEB_SITE_DESC')}">
    <title>{$_rule.title|default=config('WEB_SITE_TITLE')}-首页</title>

    {block name="pre_head"}

    {/block}
    <link rel="stylesheet" href="__STATIC__/libs/bootstrap/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="__STATIC__/libs/font-awesome/css/font-awesome.min.css">
    <link rel="stylesheet" href="__THEME__/css/app.css">

    <script src="__STATIC__/libs/seajs/dist/sea.js"></script>
    <script src="__STATIC__/libs/seajs-css/dist/seajs-css.js"></script>
    <script src="__STATIC__/libs/seajs-preload/dist/seajs-preload.js"></script>
    <script src="__THEME__/js/sea.conf.js"></script>

    <script>
        seajs.use(['bootstrap', 'layer'], function (bootstrap, layer) {
            //$.support.transition = true;
        });
    </script>
    <style>

    </style>
    {block name="style"}

    {/block}
</head>
<body>
<div class="process-bar" id="process-bar"></div>
<script>
    //AjaxBar
    seajs.use([], function () {
        var $progress = $('#process-bar');
        $(document).ajaxStart(function () {
            //only add progress bar if not added yet.
            if ($progress.length === 0) {
                $progress = $('<div><dt/><dd/></div>').attr('id', 'progress');
                $("body").append($progress);
            }
            $progress.width((50 + Math.random() * 30) + "%");
        });

        $(document).ajaxComplete(function () {
            //End loading animation
            $progress.width("100%").delay(200).fadeOut(400, function () {
                $progress.width("0%").delay(200).show();
            });
        });

    });
</script>
<div class="header">
    <div class="container">
        {block name='header'}
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
                        <a class="navbar-brand no-padding" href="{:url('/')}">
                            <img src="__THEME__/../common/images/logo.png" alt="{:config('WEB_SITE_TITLE')}">
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
                                <!--email-->
                                <a href="{:url('index/user.user/notice')}"><i class="fa fa-lg fa-bell-o"></i>
                                    <span class="badge"
                                          id="notice_badge"
                                          style="float: right;font-size: 10px;background: red;top: 16px;position: absolute;right: 2px;display: none;">1</span></a>
                            </li>
                            <li>
                                <a href=""><i class="fa fa-lg fa-envelope-o"></i></a>
                            </li>
                            <li class="dropdown">
                                <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button"
                                   aria-haspopup="true"
                                   aria-expanded="false">
                                    <img style="height: 40px;width: 40px;overflow: hidden;border-radius: 100%;"
                                         src="{$_user|getRealHeadPath|default='/theme/common/images/header.png'}"
                                         alt="">
                                    <span class="caret"></span>
                                </a>
                                {eq name="_user.id" value="-1"}
                                    <ul class="dropdown-menu user-drop-menu">
                                        <li><a href="{:url('index/portal/login')}">登陆</a></li>
                                        <li><a href="{:url('index/portal/signup')}">注册</a></li>
                                    </ul>
                                {else/}
                                    <ul class="dropdown-menu user-drop-menu animated animated-quick fadeInRight">
                                        <li><a href="#" class="text-center">{$_user.username}</a></li>
                                        <li><a href="{:url('index/user.profile/index')}">我的主页</a></li>
                                        <li><a href="{:url('index/user.attach/index')}">我的附件</a></li>
                                        <li><a href="{:url('index/user.profile/index')}">账号设置</a></li>
                                        <li><a href="{:url('user.user/logout')}">安全退出</a></li>
                                    </ul>
                                {/eq}
                            </li>
                        </ul>
                        <form class="navbar-form navbar-right" method="get" action="{:url('index/index')}">
                            <div class="form-group">
                                <input type="text" class="form-control" placeholder="文章/标签/用户/笔记" name="keywords">
                            </div>
                            <div class="btn-group navbar-btn">
                                <button type="button" class="btn btn-success" id="btn-search">搜索</button>
                                <button type="button" class="btn btn-success dropdown-toggle" data-toggle="dropdown"
                                        aria-haspopup="true" aria-expanded="false"><span class="caret"></span><span
                                            class="sr-only">显示下拉菜单</span></button>
                                <ul class="dropdown-menu">
                                    <li><a href="{:url('bbs.post/push')}">写文章</a></li>
                                    <li><a href="{:url('bbs.post/push')}">写专辑</a></li>
                                    <li><a href="{:url('bbs.post/push')}">读书笔记</a></li>
                                    <li><a href="{:url('bbs.post/push')}">普通笔记</a></li>
                                    <li role="separator" class="divider"></li>
                                    <li><a href="{:url('user.content/draft')}">草稿箱</a></li>
                                </ul>
                            </div>
                        </form>
                    </div><!-- /.navbar-collapse -->
                </div><!-- /.container-fluid -->
            </nav>
            <script>
                seajs.use(['layer'], function () {
                    $('#btn-search').click(function () {
                        layer.msg("未实现此功能呢");
                    });

                    //api


                    function getUserNotice() {
                        $.get("{:url('index/user.user/getNotice')}", function (ret) {
                            if (ret.code === 1) {
                                var notReadCount = 0;
                                ret.data.data.forEach(function (it) {
                                    if (it.status === 0) {
                                        notReadCount++;
                                    }
                                });
                                var $notice = $('#notice_badge');
                                $notice.html(notReadCount);
                                if (notReadCount <= 0) {
                                    $notice.hide();
                                } else {
                                    $notice.show();
                                }

                            }
                        });
                    }

                    //setTimeout(getUserNotice, 1000);
                    getUserNotice();

                });
            </script>
        {/block}
        {block name="category"}
            <div class="row category-list">
                <ul class="list-group list-inline">
                    <li></li>
                    <li class="category-item">
                        <a href="{:url('index/index/index')}">全部</a>
                    </li>
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
    </div>
</div>
<div class="container main-box">
    <div class="main-container">
        {block name='body'}

        {/block}
    </div>

</div>

{block name='footer'}
    <div class="footer">
        <div class="container">
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
    </div>
    <div class="container">
        <div class="row copyright">
            <p class="text-center">
                <a href="https://github.com/zhaojunlike/php-simple-bbs" target="_blank">&copy; 2017Simple BBS, Inc</a>
                <script type="text/javascript">var cnzz_protocol = (("https:" == document.location.protocol) ? " https://" : " http://");
                    document.write(unescape("%3Cspan id='cnzz_stat_icon_1263683267'%3E%3C/span%3E%3Cscript src='" + cnzz_protocol + "s19.cnzz.com/z_stat.php%3Fid%3D1263683267%26show%3Dpic1' type='text/javascript'%3E%3C/script%3E"));</script>
            </p>
        </div>
    </div>
    <div class="text-center">

    </div>
{/block}
</body>
</html>