{extend name="base/common"}

{block name="header"}

{/block}
{block name="body"}
    <div class="container page-auth">
        <div class="row">
            <div class="col-xs-4 col-xs-offset-4 auth-form-container">
                <h3 class="auth-title text-center">系统登陆</h3>
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
                        <label for="" class="control-label">验证码：</label>
                        <div class="input-group">
                            <input type="password" name="password" class="form-control input-lg" value="">
                            <div class="input-group-addon">
                                <img class="auth-verify-img" src="{:url('portal/getVerify')}" alt="">
                            </div>
                        </div>

                    </div>
                </form>
            </div>
        </div>
    </div>
{/block}