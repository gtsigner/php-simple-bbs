{extend name="base/common"}
{block name="body"}
    <div class="page row">
        <div class="col-xs-8">
            {$page}
        </div>
        <div class="col-xs-4">
            <ul class="list-inline pagination">
                <li>作者</li>
                <li>回复</li>
                <li>访问量</li>
                <li>发表时间</li>
                <li>推荐</li>
            </ul>
        </div>
    </div>
    <div class="row post-list-box">
        <table class="table">
            <tbody>
            {volist name="data_list" id="vo"}
                <tr class="text-center">
                    <td style="width: 80px">{$vo.id}</td>
                    <td class="text-left">
                        <p class="index-post-title"><a
                                    href="{:url('bbs.post/detail',['id'=>$vo['id']])}">{$vo.title}</a>
                        </p>
                    </td>
                    <td>
                        <span></span>
                        <span></span>
                    </td>
                    <td>{$vo.sort}</td>
                    <td>{$vo.id}</td>
                    <td>{$vo.id}</td>
                    <td>{$vo.id}</td>
                    <td>{$vo.id}</td>
                    <td>{$vo.id}</td>
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
    <div class="row post-box">
        <div class="row">
            <form id="postForm" action="{:url('bbs.post/post')}" method="post">
                <input type="hidden" name="category_id" value="{$category.id}">
                <h4>发表新帖（<a href="">{$category.title}</a>）：</h4>
                <br>
                <div class="form-group">

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
                </div>
            </form>
        </div>
    </div>
{/block}