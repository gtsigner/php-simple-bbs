<?php if (!defined('THINK_PATH')) exit(); /*a:2:{s:65:"/app/webroot/public/../application/index/view/bbs/post/detail.tpl";i:1499858302;s:61:"/app/webroot/public/../application/index/view/base/common.tpl";i:1499843957;}*/ ?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="keywords" content="">
    <meta name="description" content="">
    <title>-首页</title>

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
                vuePager: 'vuejs-paginate/dist/index',
                wangEditor: 'wangEditor/release/wangEditor.min',
                wangEditorCss: 'wangEditor/release/wangEditor.min'
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
<div class="container">
    
        <div class="row header-adv show">
            <img style="width:100%;height: 100%" src="http://imgad0.pconline.com.cn/ivy/image/20175/26/14957632245480.jpg?IVY_LEVEL_0?457727_329033" alt="">
        </div>
        <div class="row system-total">
            <ul class="list-inline">
                <li class="item">游客人数：<span><?php echo $_total['current_viewer']; ?></span></li>
                <li>登陆次数：<span><?php echo $_total['login_count']; ?></span></li>
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
                        <li><a href="<?php echo url('index/user.message/index'); ?>">站内信</a></li>
                        <li class="dropdown">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button"
                               aria-haspopup="true"
                               aria-expanded="false"><?php echo $_user['username']; ?> <span class="caret"></span></a>
                            <?php if($_user['id'] == '-1'): ?>
                                <ul class="dropdown-menu">
                                    <li><a href="<?php echo url('index/portal/login'); ?>">登陆</a></li>
                                    <li><a href="<?php echo url('index/portal/reg'); ?>">注册</a></li>
                                </ul>
                            <?php else: ?>
                                <ul class="dropdown-menu">
                                    <li><a href="<?php echo url('index/user.profile/index'); ?>">个人资料</a></li>
                                    <li><a href="<?php echo url('index/user.profile/resetPwd'); ?>">修改密码</a></li>
                                    <li role="separator" class="divider"></li>
                                    <li><a href="<?php echo url('portal/logout'); ?>">注 销</a></li>
                                </ul>
                            <?php endif; ?>

                        </li>
                    </ul>
                    <form class="navbar-form navbar-right" method="post" action="<?php echo url('index/bbs.post/search'); ?>">
                        <div class="form-group">
                            <input type="text" class="form-control" placeholder="关键词">
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
                        作者：<span><a href="<?php echo url('user.user/show',['user_id'=>$data->user->id]); ?>"><?php echo $data['user']['nickname']; ?></a></span>
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
                <div class="comments">
                    <?php if(is_array($data['comments']) || $data['comments'] instanceof \think\Collection || $data['comments'] instanceof \think\Paginator): $i = 0; $__LIST__ = $data['comments'];if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i;?>
                    <?php echo $vo['content']; ?>,
                        <a href=""><?php echo $vo['user']['nickname']; ?></a>
                        <img src="<?php echo $vo['user']['headPic']; ?>" alt="">
                    <?php endforeach; endif; else: echo "" ;endif; ?>

                </div>
            </div>

        </div>
    </div>
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