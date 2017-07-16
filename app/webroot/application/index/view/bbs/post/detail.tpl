{extend name="base/common"}

{block name="body"}
    <div class="post-detail">
        <div class="row">
            <div class="detail-box">
                <h3 class="text-center post-title">{$data.title}</h3>
                <ul class="list-inline text-center">
                    <li>
                        帖子编号：<span>{$data.id}</span>
                    </li>
                    <li>
                        <!-- href="{:url('user.user/show',['user_id'=>$data['user']['id']])}"-->
                        作者：<span><a>{$data.user.nickname|default='已删除'}</a></span>
                    </li>
                    <li>
                        发表时间：<span>{$data.create_time}</a></span>
                    </li>
                    <li>
                        回帖数：<span>{$data->comments()->count()}</span>
                    </li>
                    <li>
                        点击数：<span>{$data.view_count}</span>
                    </li>
                </ul>
                <div class="content row"
                     style="overflow: hidden;text-overflow: ellipsis;text-wrap: normal;white-space: normal">
                    {$data.content}
                </div>
            </div>
        </div>
    </div>
    <div class="comments">
        {volist name="comments" id="vo"}
            <div class="well comment-item no-padding">
                <div class="well-header">
                    <div class="row">
                        <div class="col-xs-2" style="width: 60px;">
                            <img style="height: 60px;width: 60px;border-radius: 5px;"
                                 src="{$vo.user|getRealHeadPath|default='/theme/common/images/header.png'}" alt="">
                        </div>
                        <div class="col-xs-10 user-msg-box">
                            <p><h4>{$vo.user.nickname}</h4></p>
                            <p style="color: #606060;">
                                <span>离线</span>
                                <small>|</small>
                                {$vo.user|getUserLevel}
                                <small>|</small>
                                发表时间
                                <small class="time">{$vo.create_time}</small>
                            </p>
                        </div>
                    </div>
                </div>
                <div class="well-content">
                    {$vo.content}
                </div>
            </div>
        {/volist}
    </div>
    <div class="comments-pager text-center">
        {$comments_page}
    </div>
    <!--评论-->
    {eq name="_user.id" value='-1'}
        <div class="row post-box well animated animated-quick slideInUp">
            <div class="row text-center">
                <h1>想回复帖子,请您先 <a href="{:url('portal/login')}">登陆</a> 系统!!!</h1>
            </div>
        </div>
    {else/}
        <div class="post-box  animated animated-quick slideInUp">
            <form id="commentForm" action="{:url('bbs.post/comment')}" method="post">
                <input type="hidden" name="post_id" value="{$data.id}">
                <div class="form-group">
                    <div id="postContent"></div>
                    <textarea name="content" id="content" class="hidden"></textarea>
                </div>
                <div class="form-group">
                    <div class="row post-verify-box">
                        <div class="col-xs-2">
                            <img style="cursor: pointer;"
                                 class="post-verify-img"
                                 src="{:url('portal/getPostVerify')}" alt="">
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
                            $this.attr('src', "{:url('portal/getPostVerify')}?v=" + Math.random());
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
    {/eq}
    <script>
        require(['jquery', 'layer', 'wangEditor'], function ($, layer, wangEditor) {

            //验证码
            $('.auth-verify-img').click(function (e) {
                e.preventDefault();
                var $this = $(this);
                $this.attr('src', "{:url('portal/getVerify')}?v=" + Math.random());
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
                                window.location = "{:url('index/index/index')}";
                            }
                        }, 2000);
                    }
                });
            });
        });
    </script>
{/block}