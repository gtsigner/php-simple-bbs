<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>{$_rule.title|default='首页'}-后台管理</title>
    <script src="__STATIC__/requirejs/require.js"></script>
    <script data-main="css!bootstrapCss" src="__THEME__/js/app.v1.js?v={:getStaticVersion()}"></script>
    <link rel="stylesheet" href="__STATIC__/bootstrap/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="__THEME__/scss/app.css">
    <script>
        var ThinkQuick = {
            module: '',
            controller: '',
            action: '',
        };
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
                    deps: ['jquery']
                },
                layer: {
                    deps: ['jquery', 'css!layerCss']
                }
            }
        });
        requirejs(['jquery', 'bootstrap'], function ($, bootstrap) {
            console.log($);
            $.support.transition = true;
        });
    </script>
</head>
<body>

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
                <a class="navbar-brand" href="#">{:config('WEB_SITE_TITLE')}-后台管理</a>
            </div>

            <!-- Collect the nav links, forms, and other content for toggling -->
            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                {volist name="_menu" id="vo"}
                    <ul class="nav navbar-nav">
                        <li class="dropdown">
                            <a href="#"
                               class="dropdown-toggle" data-toggle="dropdown" role="button"
                               aria-haspopup="true" aria-expanded="false">{$vo.title} <span class="caret"></span></a>
                            <ul class="dropdown-menu">
                                {php}if(!array_key_exists('children',$vo)){ continue; }{/php}
                                {volist name="vo.children" id="voc"}
                                    <li><a href="{:url($voc['rule'])}">{$voc.title}</a></li>
                                {/volist}
                            </ul>
                        </li>
                    </ul>
                {/volist}
                <ul class="nav navbar-nav navbar-right">
                    <li><a href="#">邮件</a></li>
                    <li><a href="{:url('index/index/index')}" target="_blank">前台</a></li>
                    <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true"
                           aria-expanded="false">{$_user.username} <span class="caret"></span></a>
                        <ul class="dropdown-menu">
                            <li><a href="#">个人资料</a></li>
                            <li><a href="#">修改密码</a></li>
                            <li role="separator" class="divider"></li>
                            <li><a href="{:url('portal/logout')}">注 销</a></li>
                        </ul>
                    </li>
                </ul>
            </div><!-- /.navbar-collapse -->
        </div><!-- /.container-fluid -->
    </nav>
{/block}
<div class="main-container">
    {block name='body'}

    {/block}
</div>

{block name='footer'}{/block}

</body>
</html>