{extend name="base/common"}
{block name="body"}
    <div class="page row">
        <div class="col-xs-8">
            {$page}
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
            {eq name="data_list|count" value="0"}
                <tr>
                    <td class="text-center text-danger" colspan="20">对不起,该栏目还没有任何帖子信息</td>
                </tr>
            {/eq}
            {volist name="data_list" id="vo"}
                <tr class="text-center">
                    <td style="width: 80px">{$vo.id}</td>
                    <td class="text-left">
                        <p class="index-post-title"><a
                                    href="{:url('bbs.post/detail',['id'=>$vo['id']])}">{$vo.title}</a>
                        </p>
                    </td>
                    <td>
                        <a href="{:url('index/index/index',['category'=>$vo['category']['id']])}">{$vo.category.title|default='<span class="text-danger">已删除</span>'}</a>
                    </td>
                    <td>
                        <p class="no-padding no-margin">{$vo.user.username|default='已删除'}</p>
                        <p class="no-padding no-margin">{$vo.create_time}</p>
                    </td>
                    <td>{$vo.comments|count}</td>
                    <td>{$vo.view_count}</td>
                    <td>{$vo.update_time|checkDateDefault|default='未有更新'}</td>
                    <td>{$vo.recommend_count}</td>
                </tr>
            {/volist}
            </tbody>
        </table>
    </div>
    <div class="page row">
        <div class="col-xs-8">
            {$page}
        </div>
        <div class="col-xs-4">

        </div>
    </div>
    {empty name="_user.username"}
        <div class="row post-box well animated">
            <div class="row text-center">
                <h1>想发帖,请您先 <a href="{:url('portal/login')}">登陆</a> 系统!!!</h1>
            </div>
        </div>
    {else/}
        <div class="row post-box well animated animated animated-quick fadeIn" style="z-index: -1">
            <div class="row">
                <form id="postForm" action="{:url('bbs.post/post')}" method="post">
                    <input type="hidden" name="category_id" value="{$category.id}">
                    <h4>发表新帖（<a href="">{$category.title}</a>）：</h4>
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
                                     src="{:url('portal/getPostVerify')}" alt="">
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
                            setTimeout(function () {
                                $(".post-box").removeClass('hidden');
                            }, 1000);
                            editor.txt.html('<p>请您填写发帖内容</p>')
                            //验证码
                            $('.post-verify-img').click(function (e) {
                                e.preventDefault();
                                var $this = $(this);
                                $this.attr('src', "{:url('portal/getPostVerify')}?v=" + Math.random());
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
    {/empty}

{/block}