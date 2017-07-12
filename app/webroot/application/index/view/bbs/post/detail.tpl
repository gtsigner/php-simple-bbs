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
                        作者：<span><a href="{:url('user.user/show',['user_id'=>$data->user->id])}">{$data.user.nickname}</a></span>
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
                <div class="comments">
                    {volist name="data.comments" id="vo"}
                    {$vo.content},
                        <a href="">{$vo.user.nickname}</a>
                        <img src="{$vo.user.headPic}" alt="">
                    {/volist}

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