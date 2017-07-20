{extend name="base/common"}
{block name="pre_head"}
    <script src="__STATIC__/editor.md/lib/raphael.min.js"></script>
{/block}
{block name="style"}
    <link rel="stylesheet" href="__STATIC__/editor.md/css/editormd.min.css">
{/block}
{block name="category"}{/block}


{block name="body"}
    <div class="post-box animated animated-quick slideInUp">
        <form id="postForm" action="{:url('bbs.post/push')}" method="post">
            <div class="form-group col-xs-8 row" style="margin-top: 20px;">
                <input type="text" name="title" class="form-control" placeholder="请输入标题">
            </div>
            <div class="form-group col-xs-4" style="margin-top: 20px;">
                <select name="category_id" class="form-control" id="">
                    <option value="0">请选择分类</option>
                    {volist name="_category" id="vo"}
                        <option value="{$vo.id}">{$vo.title}</option>
                    {/volist}
                </select>
            </div>

            <div class="form-group">
                <div class="" id="postContent">
                    <textarea class="editormd-markdown-textarea" name="postContent-markdown-doc"></textarea>
                    <!-- html textarea 需要开启配置项 saveHTMLToTextarea == true -->
                    <textarea class="editormd-html-textarea" name="postContent-html-code"></textarea>
                </div>
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
        </form>
    </div>
    <script>
        seajs.use(EditorMDDeps, function (editormd) {
            var editor = editormd({
                id: "postContent",
                height: 640,
                path: "/static/editor.md/lib/",
                toolbarIcons: function () {
                    // Or return editormd.toolbarModes[name]; // full, simple, mini
                    // Using "||" set icons align right.
                    return ["undo", "redo", "|", "bold", "hr", "|", "preview", "watch", "|", "fullscreen", "info", "testIcon", "testIcon2", "file", "faicon", "||", "watch", "fullscreen", "preview", "testIcon"]
                },
                //toolbar  : false,             // 关闭工具栏
                codeFold: true,
                searchReplace: true,
                saveHTMLToTextarea: true,      // 保存 HTML 到 Textarea
                htmlDecode: "style,script,iframe|on*",            // 开启 HTML 标签解析，为了安全性，默认不开启
                emoji: true,
                taskList: true,
                tocm: true,          // Using [TOCM]
                tex: true,                      // 开启科学公式 TeX 语言支持，默认关闭
                //previewCodeHighlight : false,  // 关闭预览窗口的代码高亮，默认开启
                flowChart: true,                // 疑似 Sea.js与 Raphael.js 有冲突，必须先加载 Raphael.js ，Editor.md 才能在 Sea.js 下正常进行；
                sequenceDiagram: true,          // 同上
                //dialogLockScreen : false,      // 设置弹出层对话框不锁屏，全局通用，默认为 true
                //dialogShowMask : false,     // 设置弹出层对话框显示透明遮罩层，全局通用，默认为 true
                //dialogDraggable : false,    // 设置弹出层对话框不可拖动，全局通用，默认为 true
                //dialogMaskOpacity : 0.4,    // 设置透明遮罩层的透明度，全局通用，默认值为 0.1
                //dialogMaskBgColor : "#000", // 设置透明遮罩层的背景颜色，全局通用，默认为 #fff
                imageUpload: true,
                imageFormats: ["jpg", "jpeg", "gif", "png", "bmp", "webp"],
                imageUploadURL: "{:url('api/uploader/uploadEditorImg?pic_type=10')}",
                onload: function () {

                }
            });
        });

        seajs.use(['layer'], function (layer) {

            //验证码
            $(".post-verify-img").click(function (e) {
                e.preventDefault();
                var $this = $(this);
                $this.attr('src', "{:url('portal/getPostVerify')}?v=" + Math.random());
            });
            //

            $('#postForm').submit(function (e) {
                e.preventDefault();
                var $this = $(this);
                $.post($this.attr('action'), $this.serialize(), function (ret) {
                    layer.alert(ret.msg);
                    $(".post-verify-img").trigger('click');
                });
            });

            //验证码
            $('.auth-verify-img').click(function (e) {
                e.preventDefault();
                var $this = $(this);
                $this.attr('src', "{:url('portal/getVerify')}?v=" + Math.random());
            });

        });
    </script>
{/block}