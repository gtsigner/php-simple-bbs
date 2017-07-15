<?php if (!defined('THINK_PATH')) exit(); /*a:2:{s:61:"/app/webroot/public/../application/index/view/index/index.tpl";i:1500117199;s:61:"/app/webroot/public/../application/index/view/base/common.tpl";i:1500116989;}*/ ?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="keywords" content="<?php echo (isset($_rule['title']) && ($_rule['title'] !== '')?$_rule['title']:config('WEB_SITE_KEYWORDS')); ?>">
    <meta name="description" content="<?php echo (isset($_rule['title']) && ($_rule['title'] !== '')?$_rule['title']:config('WEB_SITE_DESC')); ?>">
    <title><?php echo (isset($_rule['title']) && ($_rule['title'] !== '')?$_rule['title']:config('WEB_SITE_TITLE')); ?>-首页</title>

    <script src="__STATIC__/requirejs/require.js"></script>
    <script data-main="css!bootstrapCss" src="__THEME__/js/app.v1.js?v=<?php echo getStaticVersion(); ?>"></script>
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

</head>
<body>
<div class="container main-box">
    
        <div class="row header-adv show">
            <img style="width:100%;height: 100%"
                 src="http://imgad0.pconline.com.cn/ivy/image/20175/26/14957632245480.jpg?IVY_LEVEL_0?457727_329033"
                 alt="">
        </div>
        <div class="row system-total">
            <ul class="list-inline">
                <li class="item">游客人数：<span><?php echo $_total['current_viewer']; ?></span></li>
                <li>在线人数： <span><?php echo $_total['current_online']; ?></span></li>
                <li>会员总数：<span><?php echo $_total['user_count']; ?></span></li>
                <li>今日发帖：<span><?php echo $_total['today_post_count']; ?></span></li>
                <li>帖子总数： <span><?php echo $_total['post_count']; ?></span></li>
            </ul>
        </div>
    

    
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
                    <a class="navbar-brand" href="<?php echo url('/'); ?>">
                        <img class="header-logo" src="#" alt="">
                    </a>
                </div>

                <!-- Collect the nav links, forms, and other content for toggling -->
                <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                    <ul class="nav navbar-nav">
                        <?php if(is_array($_menu) || $_menu instanceof \think\Collection || $_menu instanceof \think\Paginator): $i = 0; $__LIST__ = $_menu;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i;if(empty($vo['children']) || (($vo['children'] instanceof \think\Collection || $vo['children'] instanceof \think\Paginator ) && $vo['children']->isEmpty())): ?>
                            <li><a href="<?php echo url($vo['rule']); ?>"><?php echo $vo['title']; ?></a></li>
                        <?php else: ?>
                            <ul class="nav navbar-nav">
                                <li class="dropdown">
                                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button"
                                       aria-haspopup="true" aria-expanded="false"><?php echo $vo['title']; ?> <span
                                                class="caret"></span></a>
                                    <ul class="dropdown-menu">
                                        <?php if(is_array($vo['children']) || $vo['children'] instanceof \think\Collection || $vo['children'] instanceof \think\Paginator): $i = 0; $__LIST__ = $vo['children'];if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$voc): $mod = ($i % 2 );++$i;?>
                                            <li><a href="<?php echo url($voc['rule']); ?>"><?php echo $voc['title']; ?></a></li>
                                        <?php endforeach; endif; else: echo "" ;endif; ?>
                                    </ul>
                                </li>
                            </ul>
                        <?php endif; endforeach; endif; else: echo "" ;endif; ?>
                    </ul>
                    <ul class="nav navbar-nav navbar-right">
                        <li class="dropdown">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button"
                               aria-haspopup="true"
                               aria-expanded="false"
                               style="padding: 5px;">
                                <img style="height: 40px;width: 40px;overflow: hidden;border-radius: 100%;"
                                     src="<?php echo (getRealHeadPath($_user) ?: '/theme/common/images/header.png'); ?>"
                                     alt="">
                                <?php echo (isset($_user['username']) && ($_user['username'] !== '')?$_user['username']:'游客请登录'); ?>
                                <span class="caret"></span>
                            </a>
                            <?php if(empty($_user['id']) || (($_user['id'] instanceof \think\Collection || $_user['id'] instanceof \think\Paginator ) && $_user['id']->isEmpty())): ?>
                            <ul class="dropdown-menu user-drop-menu">
                                <li><a href="<?php echo url('index/portal/login'); ?>">登陆</a></li>
                                <li><a href="<?php echo url('index/portal/reg'); ?>">注册</a></li>
                            </ul>
                            <?php else: ?>
                            <ul class="dropdown-menu user-drop-menu animated animated-quick fadeInRight">
                                <li><a class="text-center text-success">欢迎您，<?php echo $_user['nickname']; ?></a></li>
                                <li><a>积分: <span class="text-success"><?php echo $_user['score']; ?></span></a></li>
                                <li><a href="<?php echo url('index/user.profile/index'); ?>">个人资料</a></li>
                                <li><a href="<?php echo url('index/user.attach/index'); ?>">我的附件</a></li>
                                <li><a href="<?php echo url('index/user.profile/resetPwd'); ?>">修改密码</a></li>
                                <li role="separator" class="divider"></li>
                                <li><a href="<?php echo url('portal/logout'); ?>">注销登陆</a></li>
                            </ul>
                            <?php endif; ?>
                        </li>
                    </ul>
                    <form class="navbar-form navbar-right" method="get" action="<?php echo url('index/index'); ?>">
                        <div class="form-group">
                            <input type="text" class="form-control" placeholder="关键词" name="keywords">
                        </div>
                        <button type="submit" class="btn btn-primary">搜贴</button>
                    </form>

                </div><!-- /.navbar-collapse -->
            </div><!-- /.container-fluid -->
        </nav>
    
    
        <div class="row category-list">
            <ul class="list-group list-inline">
                <li></li>
                <?php if(is_array($_category) || $_category instanceof \think\Collection || $_category instanceof \think\Paginator): $i = 0; $__LIST__ = $_category;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i;if($vo['id'] == $category['id']): ?>
                    <li class="category-item active">
                        <a href="<?php echo url('index/index/index',['category'=>$vo['id']]); ?>"><?php echo $vo['title']; ?></a>
                    </li>
                <?php else: ?>
                    <li class="category-item">
                        <a href="<?php echo url('index/index/index',['category'=>$vo['id']]); ?>"><?php echo $vo['title']; ?></a>
                    </li>
                <?php endif; endforeach; endif; else: echo "" ;endif; ?>
            </ul>
        </div>
    
    <div class="main-container">
        
    <div class="page row">
        <div class="col-xs-8">
            <?php echo $page; ?>
        </div>
    </div>
    <div class="row post-list-box">
        <table class="table table-hover text-center">
            <thead class="">
            <tr>
                <td><label for="">ID</label></td>
                <td class="text-left"><label for="">标题</label></td>
                <td><label for="">栏目</label></td>
                <td><label for="">作者</label></td>
                <td><label for="">回复量</label></td>
                <td><label for="">访问量</label></td>
                <td><label for="">更新时间</label></td>
                <td><label for="">推荐</label></td>
            </tr>
            </thead>
            <tbody>
            <?php if(count($data_list) == '0'): ?>
                <tr>
                    <td class="text-center text-danger" colspan="20">对不起,该栏目还没有任何帖子信息</td>
                </tr>
            <?php endif; if(is_array($data_list) || $data_list instanceof \think\Collection || $data_list instanceof \think\Paginator): $i = 0; $__LIST__ = $data_list;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i;?>
                <tr class="text-center">
                    <td style="width: 80px"><?php echo $vo['id']; ?></td>
                    <td class="text-left">
                        <p class="index-post-title"><a
                                    href="<?php echo url('bbs.post/detail',['id'=>$vo['id']]); ?>"><?php echo $vo['title']; ?></a>
                        </p>
                    </td>
                    <td>
                        <a href="<?php echo url('index/index/index',['category'=>$vo['category']['id']]); ?>"><?php echo (isset($vo['category']['title']) && ($vo['category']['title'] !== '')?$vo['category']['title']:'<span class="text-danger">已删除</span>'); ?></a>
                    </td>
                    <td>
                        <p class="no-padding no-margin"><?php echo (isset($vo['user']['username']) && ($vo['user']['username'] !== '')?$vo['user']['username']:'已删除'); ?></p>
                        <p class="no-padding no-margin"><?php echo $vo['create_time']; ?></p>
                    </td>
                    <td><?php echo count($vo['comments']); ?></td>
                    <td><?php echo $vo['view_count']; ?></td>
                    <td><?php echo (checkDateDefault($vo['update_time']) ?: '未有更新'); ?></td>
                    <td><?php echo $vo['recommend_count']; ?></td>
                </tr>
            <?php endforeach; endif; else: echo "" ;endif; ?>
            </tbody>
        </table>
    </div>
    <div class="page row">
        <div class="col-xs-8">
            <?php echo $page; ?>
        </div>
        <div class="col-xs-4">

        </div>
    </div>
    <?php if(empty($_user) || (($_user instanceof \think\Collection || $_user instanceof \think\Paginator ) && $_user->isEmpty())): ?>
        <div class="row post-box well animated animated-quick slideInUp">
            <div class="row text-center">
                <h1>想发帖,请您先 <a href="<?php echo url('portal/login'); ?>">登陆</a> 系统!!!</h1>
            </div>
        </div>
    <?php else: ?>
        <div class="row post-box well animated animated-quick slideInUp">
            <div class="row">
                <form id="postForm" action="<?php echo url('bbs.post/post'); ?>" method="post">
                    <input type="hidden" name="category_id" value="<?php echo $category['id']; ?>">
                    <h4>发表新帖（<a href=""><?php echo $category['title']; ?></a>）：</h4>
                    <br>

                    <div class="form-group">
                        <input type="text" name="title" value="" placeholder="填写帖子标题" class="form-control">
                    </div>
                    <div class="form-group">
                        <div id="postContent"></div>
                        <textarea name="content" id="content" class="hidden"></textarea>
                    </div>
                    <div class="form-group">
                        <div class="row post-verify-box">
                            <div class="col-xs-2">
                                <img style="cursor: pointer;"
                                     class="post-verify-img"
                                     src="<?php echo url('portal/getPostVerify'); ?>" alt="">
                            </div>
                            <div class="col-xs-3">
                                <input type="text" name="verify_code" class="form-control input-lg"
                                       value=""
                                       placeholder="请输入验证码结果">
                            </div>
                            <div class="col-xs-3">
                                <button type="submit" class="btn btn-primary btn-lg">确认发帖</button>
                            </div>
                        </div>
                    </div>
                    <script>
                        require(['wangEditor', 'jquery', 'layer'], function (wangEditor, $, layer) {
                            var editor = new wangEditor('#postContent');
                            editor.create();
                            editor.txt.html('<p>请您填写发帖内容</p>')
                            //验证码
                            $('.post-verify-img').click(function (e) {
                                e.preventDefault();
                                var $this = $(this);
                                $this.attr('src', "<?php echo url('portal/getPostVerify'); ?>?v=" + Math.random());
                            });
                            //
                            $('#postForm').submit(function (e) {
                                e.preventDefault();
                                var $this = $(this);
                                $("#content").html(editor.txt.html());
                                $.post($this.attr('action'), $this.serialize(), function (ret) {
                                    layer.alert(ret.msg);
                                    $(".post-verify-img").trigger('click');
                                    if (1 === ret.code) {
                                        setTimeout(function () {
                                            window.location.reload();
                                        }, 1300);
                                        //$('#error_msg').html(ret.msg);
                                    }
                                });
                            });
                        });
                    </script>
                </form>
            </div>
        </div>
    <?php endif; ?>


    </div>
    
        <div class="footer">
            <div class="row friend-link-box">
                <div class="row">
                    <ul class="list-inline">
                        <li class="friend-link-head">
                            友情链接：
                        </li>
                        <?php if(is_array($_friend_links) || $_friend_links instanceof \think\Collection || $_friend_links instanceof \think\Paginator): $i = 0; $__LIST__ = $_friend_links;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i;?>
                            <li class="friend-link-item">
                                <a href="<?php echo $vo['url']; ?>"><?php echo $vo['title']; ?></a>
                            </li>
                        <?php endforeach; endif; else: echo "" ;endif; ?>
                    </ul>
                </div>
            </div>
        </div>
    
</div>
</body>
</html>