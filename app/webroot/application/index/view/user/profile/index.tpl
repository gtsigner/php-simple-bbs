{extend name="base/common"}

{block name="body"}
    <div class="container page-auth">
        <div class="row">
            <div class="col-xs-4 col-xs-offset-4 auth-form-container">
                <h3 class="auth-title text-center">个人资料</h3>
                <form action="{:url('user.profile/upProfile')}" method="post" class="form">
                    <div class="form-group text-center">
                        <label for=""></label>
                        <div>
                            <img style="height: 140px;width: 140px;cursor: pointer;margin-bottom: 10px;border-radius: 100%;"
                                 id="user-head-img"
                                 draggable="false"
                                 src="{$_user|getRealHeadPath|default='/theme/common/images/header.png'}"
                                 alt="">
                            <br>
                            <button type="button" class="btn btn-primary btn-sm" id="uploadBtn">上传新头像</button>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="">用户昵称</label>
                        <input type="text" class="form-control" name="nickname" value="{$_user.nickname}">
                    </div>
                    <div class="form-group">
                        <button type="submit" class="btn btn-lg btn-danger btn-block">确认修改</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
    <script>
        require(['jquery', 'layer', 'ajaxUploader'], function ($, layer, AjaxUploader) {
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
                                window.location.reload();
                            }
                        }, 2000);
                    }
                });
            });

            //Ajax
            var uploader = new AjaxUploader.SimpleUpload({
                button: 'uploadBtn', // file upload button
                url: '{:url('api/uploader/upHeadImg')}', // server side handler
                name: 'up_file', // upload parameter name
                progressUrl: 'uploadProgress.php', // enables cross-browser progress support (more info below)
                responseType: 'json',
                multiple: false,
                //allowedExtensions: ['jpg', 'jpeg', 'png', 'gif'],
                maxSize: 2048 * 10, // kilobytes
                hoverClass: 'ui-state-hover',
                focusClass: 'ui-state-focus',
                disabledClass: 'btn-disabled btn-danger',
                onError: function (filename, type) {
                    console.log(filename);
                },
                onSubmit: function (filename, extension) {
                    $("#uploadBtn").html("上传中,请稍后...........");
                },
                onComplete: function (filename, response) {
                    $("#uploadBtn").html("修改新头像");
                    $("#user-head-img").attr('src', response.data.path);
                    layer.msg(response.msg);
                    // do something with response...
                }
            });
        });
    </script>
{/block}