{extend name="base/common"}

{block name="body"}
    <div class="container page-auth">
        <div class="row">
            <div class="col-xs-4 col-xs-offset-4 auth-form-container">
                <h3 class="auth-title text-center">会员注册</h3>
                <form action="{:url()}" method="post" class="form">
                    <div class="form-group">
                        <label for="" class="control-label">用户名：</label>
                        <input type="text" name="username" class="form-control input-lg" value="">
                    </div>
                    <div class="form-group">
                        <label for="" class="control-label">密 码：</label>
                        <input type="password" name="password" class="form-control input-lg" value="">
                    </div>
                    <div class="form-group">
                        <label for="" class="control-label">确认密码：</label>
                        <input type="password" name="re_password" class="form-control input-lg" value="">
                    </div>
                    <div class="form-group">
                        <label for="" class="control-label">验证码：</label>
                        <div class="input-group">
                            <input type="text" name="verify_code" class="form-control input-lg" value="">
                            <div class="input-group-addon" style="padding: 0">
                                <img style="height: 40px;cursor: pointer"
                                     class="auth-verify-img"
                                     src="{:url('portal/getVerify')}"
                                     alt="">
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <p class="text-center text-danger" id="error_msg"></p>
                        <button type="submit" class="btn btn-lg btn-primary btn-block">确认注册</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
    <script>
        seajs.use((['jquery', 'layer'], function ($, layer) {

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
                    if (200 !== ret.code) {
                        $('#error_msg').html(ret.msg);
                    } else {
                        setTimeout(function () {
                            if (ret.data.url) {
                                window.location = ret.data.url;
                            } else {
                                window.location = "{:url('index/portal/login')}";
                            }
                        }, 2000);
                    }
                });
            });
        });

    </script>
{/block}