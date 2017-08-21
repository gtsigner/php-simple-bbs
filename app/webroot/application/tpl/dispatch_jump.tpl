{__NOLAYOUT__}
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
        "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>跳转提示</title>
    <link rel="stylesheet" type="text/css" href="__STATIC__/libs/bootstrap/dist/css/bootstrap.min.css">
    <script src="__STATIC__/libs/seajs/dist/sea.js"></script>
    <script src="__STATIC__/libs/seajs-css/dist/seajs-css.js"></script>
    <script src="__STATIC__/libs/seajs-preload/dist/seajs-preload.js"></script>
    <script src="__THEME__/js/sea.conf.js"></script>
    {block name="style"}

    {/block}
    <script>
        seajs.use(['jquery', 'bootstrap'], function ($) {

        });
    </script>
</head>
<body>
<div>


</div>
<script type="text/javascript">
    seajs.use(['layer'], function () {
        layer.msg("{$msg}");
    });
    (function () {
        var href = "{$url}";
        var wait = parseInt("{$wait}");
        var interval = setInterval(function () {
            wait--;
            if (wait <= 0) {
                location.href = href;
                clearInterval(interval);
            }
        }, 1000);
    })();
</script>
</body>
</html>
