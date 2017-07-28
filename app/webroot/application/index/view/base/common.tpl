<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="keywords" content="{$_rule.title|default=config('WEB_SITE_KEYWORDS')}">
    <meta name="description" content="{$_rule.title|default=config('WEB_SITE_DESC')}">
    <title>{$_rule.title|default=config('WEB_SITE_TITLE')}-首页-Power BY Simple BBS</title>

    {block name="pre_head"}

    {/block}
    <script src="__STATIC__/seajs/dist/sea.js"></script>
    <script src="__STATIC__/seajs-css/dist/seajs-css.js"></script>
    <script src="__STATIC__/seajs-preload/dist/seajs-preload.js"></script>
    <link rel="stylesheet" href="__STATIC__/bootstrap/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="__STATIC__/font-awesome/css/font-awesome.min.css">
    <link rel="stylesheet" href="__THEME__/css/app.css">
    <script>
        seajs.config({
            base: '/static',
            alias: {
                jquery: 'jquery/dist/jquery.min',
                bootstrap: 'bootstrap/dist/js/bootstrap.min',
                vue: 'vue/dist/vue.min',
                axios: 'axios/dist/axios.min',
                appCss: '../theme/admin/scss/app.js',
                bootstrapCss: 'bootstrap/dist/css/bootstrap.min.js',
                wangEditor: 'wangEditor/release/wangEditor.min',
                wangEditorCss: 'wangEditor/release/wangEditor.min',
                animateCss: 'animate.css/animate.min',
                vuePager: 'vuejs-paginate/dist/index',
                ajaxUploader: 'AjaxUploader/SimpleAjaxUploader.min.js',
                layer: 'layer/layer.js',
                layerCss: 'layer/skin/layer.css',
                editormd: "editor.md/editormd.min"
            },
            preload: ['jquery', 'layerCss'],
            debug: true,
            charset: 'utf-8'
        });
        var EditorMDDeps = [
            "editormd"
//            "__STATIC__/editor.md/plugins/link-dialog/link-dialog",
//            "__STATIC__/editor.md/plugins/reference-link-dialog/reference-link-dialog",
//            "__STATIC__/editor.md/plugins/image-dialog/image-dialog",
//            "__STATIC__/editor.md/plugins/code-block-dialog/code-block-dialog",
//            "__STATIC__/editor.md/plugins/table-dialog/table-dialog",
//            "__STATIC__/editor.md/plugins/emoji-dialog/emoji-dialog",
//            "__STATIC__/editor.md/plugins/goto-line-dialog/goto-line-dialog",
//            "__STATIC__/editor.md/plugins/help-dialog/help-dialog",
//            "__STATIC__/editor.md/plugins/html-entities-dialog/html-entities-dialog",
//            "__STATIC__/editor.md/plugins/preformatted-text-dialog/preformatted-text-dialog"
        ];

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
<div class="header">
    <div class="container">
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
                        <a class="navbar-brand" href="{:url('/')}">{:config('WEB_SITE_TITLE')}</a>
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
                            <li>
                                <a href=""><i class="fa fa-lg fa-bell-o"></i></a>
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
                                        <li><a href="{:url('index/portal/reg')}">注册</a></li>
                                    </ul>
                                {else/}
                                    <ul class="dropdown-menu user-drop-menu animated animated-quick fadeInRight">
                                        <li><a href="{:url('index/user.profile/index')}">我的主页</a></li>
                                        <li><a href="{:url('index/user.attach/index')}">我的附件</a></li>
                                        <li><a href="{:url('index/user.profile/index')}">资料档案</a></li>
                                        <li><a href="{:url('index/user.profile/index')}">我的资产</a></li>
                                        <li><a href="{:url('index/user.profile/index')}">账号设置</a></li>
                                        <li><a href="{:url('portal/logout')}">退出</a></li>
                                        <li role="separator" class="divider"></li>
                                        <li><a href="{:url('index/user.profile/resetPwd')}">意见反馈</a></li>
                                        <li><a href="{:url('index/user.profile/resetPwd')}">用户投诉</a></li>
                                    </ul>
                                {/eq}
                            </li>
                        </ul>
                        <form class="navbar-form navbar-right" method="get" action="{:url('index/index')}">
                            <div class="form-group">
                                <input type="text" class="form-control" placeholder="关键词" name="keywords">
                            </div>
                        </form>
                    </div><!-- /.navbar-collapse -->
                </div><!-- /.container-fluid -->
            </nav>
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
            </p>
        </div>
    </div>
    <div class="text-center">
        <script type="text/javascript">var cnzz_protocol = (("https:" == document.location.protocol) ? " https://" : " http://");
            document.write(unescape("%3Cspan id='cnzz_stat_icon_1262977691'%3E%3C/span%3E%3Cscript src='" + cnzz_protocol + "s13.cnzz.com/z_stat.php%3Fid%3D1262977691%26show%3Dpic' type='text/javascript'%3E%3C/script%3E"));</script>
    </div>
{/block}
</body>
</html>