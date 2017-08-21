{extend name="base/common"}
{block name="pre_head"}
    <script src="__STATIC__/libs/editor.md/lib/raphael.min.js"></script>
    <link rel="stylesheet" href="__STATIC__/libs/editor.md/css/editormd.min.css">
{/block}

{block name="category"}{/block}
{block name="body"}
    <div class="post-box animated animated-quick slideInUp">
        <form id="post_form" action="{:url('bbs.post/push')}" method="post">
            <input type="hidden" name="method" value="{$form.method|default='add'}">
            <input type="hidden" name="id" value="{$data.id|default=''}">
            <div class="row" style="margin-top: 20px">
                <div class="form-group col-xs-6 no-padding">
                    <input type="text" name="title" value="{$data.title|default=''}"
                           class="form-control input-lg"
                           placeholder="请输入标题">
                </div>
                <div class="form-group col-xs-3 no-padding" style="margin-left: 10px;">
                    <select name="category_id" class="form-control input-lg" id="">
                        <option value="0">请选择分类</option>
                        {volist name="_category" id="vo"}
                        {eq name="data.category_id" value="$vo.id"}
                            <option value="{$vo.id}" selected>{$vo.title}</option>
                        {else/}
                            <option value="{$vo.id}">{$vo.title}</option>
                        {/eq}
                        {/volist}
                    </select>
                </div>
            </div>
            <div class="form-group">
                <input type="text" name="tags" class="form-control input-lg" placeholder="标签，如：php 可使用逗号,分号;分隔">
            </div>
            <div class="form-group">
                <div class="" id="post_content">
                    <textarea class="editormd-markdown-textarea"
                              name="md_content">{$data.md_content|default=''}</textarea>
                    <textarea class="editormd-html-textarea" name="content"></textarea>
                </div>
            </div>
        </form>
    </div>
    <div class="block" style="line-height: 80px;height: 80px;"></div>
    <nav class="navbar navbar-default navbar-fixed-bottom">
        <div class="container">
            <div class="row">
                <form class="navbar-form navbar-right">
                    <div class="form-group form-group-lg">
                        <div class="input-group input-group-lg">
                            <div class="input-group-addon no-padding" style="padding: 0">
                                <img style="cursor: pointer;height: 42px;"
                                     class="post-verify-img"
                                     src="{:url('portal/getPostVerify')}" alt="">
                            </div>
                            <input type="text" name="verify_code" class="form-control"
                                   value=""
                                   placeholder="请输入验证码结果">
                        </div>
                    </div>
                    <div class="form-group form-group-lg">
                        <button type="button" class="btn btn-default btn-lg">定时发布</button>
                        <button type="button" class="btn btn-primary btn-lg post-submit-btn">立即发布</button>
                    </div>
                </form>
            </div>
        </div>
    </nav>
    <script>
        seajs.use(['editormd'], function (editormd) {
            var editor = editormd({
                id: "post_content",
                height: 840,
                path: "/static/libs/editor.md/lib/",
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

        seajs.use(['layer', 'ajaxForm'], function () {

            //验证码
            $(".post-verify-img").click(function (e) {
                e.preventDefault();
                var $this = $(this);
                $this.attr('src', "{:url('portal/getPostVerify')}?v=" + Math.random());
            });
            //
            $(".post-submit-btn").click(function () {
                console.log("submit");
                $("#post_form").trigger("submit");
            });
            //发帖成功后，进入到详细页面
            $('#post_form').ajaxForm(function (ret) {
                if (ret.code === 1) {
                    window.location.href = ret.url;
                } else {
                    layer.msg(ret.msg);
                    $(".post-verify-img").trigger('click');
                }
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
{block name="footer"}
{/block}