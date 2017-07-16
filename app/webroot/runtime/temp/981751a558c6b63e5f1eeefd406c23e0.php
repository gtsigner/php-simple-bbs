<?php if (!defined('THINK_PATH')) exit(); /*a:2:{s:65:"/app/webroot/public/../application/index/view/bbs/post/detail.tpl";i:1500190214;s:61:"/app/webroot/public/../application/index/view/base/common.tpl";i:1500169802;}*/ ?>
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
                            <?php if($_user['id'] == '-1'): ?>
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
        
    <div class="post-detail">
        <div class="row">
            <div class="detail-box">
                <h3 class="text-center post-title"><?php echo $data['title']; ?></h3>
                <ul class="list-inline text-center">
                    <li>
                        帖子编号：<span><?php echo $data['id']; ?></span>
                    </li>
                    <li>
                        <!-- href="<?php echo url('user.user/show',['user_id'=>$data['user']['id']]); ?>"-->
                        作者：<span><a><?php echo (isset($data['user']['nickname']) && ($data['user']['nickname'] !== '')?$data['user']['nickname']:'已删除'); ?></a></span>
                    </li>
                    <li>
                        发表时间：<span><?php echo $data['create_time']; ?></a></span>
                    </li>
                    <li>
                        回帖数：<span><?php echo $data->comments()->count(); ?></span>
                    </li>
                    <li>
                        点击数：<span><?php echo $data['view_count']; ?></span>
                    </li>
                </ul>
                <div class="content row"
                     style="overflow: hidden;text-overflow: ellipsis;text-wrap: normal;white-space: normal">
                    <?php echo $data['content']; ?>
                </div>
            </div>
        </div>
    </div>
    <div class="comments">
        <?php if(is_array($comments) || $comments instanceof \think\Collection || $comments instanceof \think\Paginator): $i = 0; $__LIST__ = $comments;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i;?>
            <div class="well comment-item no-padding">
                <div class="well-header">
                    <div class="row">
                        <div class="col-xs-2" style="width: 60px;">
                            <img style="height: 60px;width: 60px;border-radius: 5px;"
                                 src="<?php echo (getRealHeadPath($vo['user']) ?: '/theme/common/images/header.png'); ?>" alt="">
                        </div>
                        <div class="col-xs-10 user-msg-box">
                            <p><h4><?php echo $vo['user']['nickname']; ?></h4></p>
                            <p style="color: #606060;">
                                <span>离线</span>
                                <small>|</small>
                                <?php echo getUserLevel($vo['user']); ?>
                                <small>|</small>
                                发表时间
                                <small class="time"><?php echo $vo['create_time']; ?></small>
                            </p>
                        </div>
                    </div>
                </div>
                <div class="well-content">
                    <?php echo $vo['content']; ?>
                </div>
            </div>
        <?php endforeach; endif; else: echo "" ;endif; ?>
    </div>
    <div class="comments-pager text-center">
        <?php echo $comments_page; ?>
    </div>
    <!--评论-->
    <?php if($_user['id'] == '-1'): ?>
        <div class="row post-box well animated animated-quick slideInUp">
            <div class="row text-center">
                <h1>想回复帖子,请您先 <a href="<?php echo url('portal/login'); ?>">登陆</a> 系统!!!</h1>
            </div>
        </div>
    <?php else: ?>
        <div class="post-box  animated animated-quick slideInUp">
            <form id="commentForm" action="<?php echo url('bbs.post/comment'); ?>" method="post">
                <input type="hidden" name="post_id" value="<?php echo $data['id']; ?>">
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
                            <button type="submit" class="btn btn-primary btn-lg">确认回复</button>
                        </div>
                    </div>
                </div>
                <script>
                    require(['wangEditor', 'jquery', 'layer'], function (wangEditor, $, layer) {
                        var editor = new wangEditor('#postContent');
                        editor.create();
                        editor.txt.html('')
                        //验证码
                        $('.post-verify-img').click(function (e) {
                            e.preventDefault();
                            var $this = $(this);
                            $this.attr('src', "<?php echo url('portal/getPostVerify'); ?>?v=" + Math.random());
                        });
                        //
                        $('#commentForm').submit(function (e) {
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
    <?php endif; ?>
    <script>
        require(['jquery', 'layer', 'wangEditor'], function ($, layer, wangEditor) {

            //验证码
            $('.auth-verify-img').click(function (e) {
                e.preventDefault();
                var $this = $(this);
                $this.attr('src', "<?php echo url('portal/getVerify'); ?>?v=" + Math.random());
            });

            $('.form').submit(function (e) {
                e.preventDefault();
                var $this = $(this);
                $.post($this.attr('action'), $this.serialize(), function (ret) {
                    layer.alert(ret.msg);
                    if (1 !== ret.code) {
                        //$('#error_msg').html(ret.msg);
                    } else {
                        setTimeout(function () {
                            if (ret.data.url) {
                                window.location = ret.data.url;
                            } else {
                                window.location = "<?php echo url('index/index/index'); ?>";
                            }
                        }, 2000);
                    }
                });
            });
        });
    </script>

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