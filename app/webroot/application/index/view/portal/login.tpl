{extend name="base/common"}

{block name="body"}
    <div class="container page-auth">
        <div class="row">
            <div class="col-xs-4 col-xs-offset-4 auth-form-container">
                <h3 class="auth-title text-center">会员登陆</h3>
                <form action="{:url()}" method="post" class="form">
                    <div class="form-group">
                        <label for="" class="control-label">用户名：</label>
                        <input type="text" name="username" class="form-control input-lg" value=""
                               placeholder="">
                    </div>

                    <div class="form-group">
                        <label for="" class="control-label">密 码：</label>
                        <input type="password" name="password" class="form-control input-lg" value=""
                               placeholder="">
                    </div>
                    <div class="form-group">
                        <label for="" class="control-label">验证码：</label>
                        <div class="input-group">
                            <div class="input-group-addon" style="padding: 0;border-radius: 0;overflow: hidden">
                                <img style="height: 44px;cursor: pointer;border: none"
                                     class="auth-verify-img"
                                     src="{:url('portal/getVerify')}"
                                     alt="">
                            </div>
                            <input type="text" name="verify_code" class="form-control input-lg" value="">
                        </div>
                    </div>
                    <div class="form-group">
                        <p class="text-danger" id="error_msg"></p>
                        <button type="submit" class="btn btn-lg btn-primary btn-block">账号登陆</button>
                    </div>
                    <div class="form-group">
                        <p class="text-center">
                            <a href="{:url('portal/signup')}">立即注册</a>
                            <span>|</span>
                            <a href="{:url('portal/findPwd')}">忘记密码</a>
                        </p>
                    </div>
                </form>
            </div>
        </div>
    </div>
    <script>
        seajs.use(['layer', 'ajaxForm'], function () {

            //验证码
            $('.auth-verify-img').click(function (e) {
                e.preventDefault();
                var $this = $(this);
                $this.attr('src', "{:url('portal/getVerify')}?v=" + Math.random());
            });

            $('.form').ajaxForm(function (ret) {
                layer.alert(ret.msg);
                $('#error_msg').html(ret.msg);
                if (1 === ret.code) {
                    setTimeout(function () {
                        if (ret.data.url) {
                            window.location = ret.data.url;
                        } else {
                            window.location = "{:url('index/index/index')}";
                        }
                    }, 1600);
                }
            });
        });
    </script>
{/block}