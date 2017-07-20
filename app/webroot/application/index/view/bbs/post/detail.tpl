{extend name="base/common"}
{block name="pre_head"}
    <script src="__STATIC__/editor.md/lib/raphael.min.js"></script>
{/block}
{block name="style"}
    <link rel="stylesheet" href="__STATIC__/editor.md/css/editormd.min.css">
{/block}

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
                        <!-- href="{:url('user.user/show',['user_id'=>$data['user']['id']])}"-->
                        作者：<span><a>{$data.user.nickname|default='已删除'}</a></span>
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
            </div>
        </div>
    </div>
    <div class="comments">
        {volist name="comments" id="vo"}
            <div class="well comment-item no-padding">
                <div class="well-header">
                    <div class="row">
                        <div class="col-xs-2" style="width: 60px;">
                            <img style="height: 60px;width: 60px;border-radius: 5px;"
                                 src="{$vo.user|getRealHeadPath|default='/theme/common/images/header.png'}" alt="">
                        </div>
                        <div class="col-xs-10 user-msg-box">
                            <p><h4>{$vo.user.nickname}</h4></p>
                            <p style="color: #606060;">
                                <span>离线</span>
                                <small>|</small>
                                {$vo.user|getUserLevel}
                                <small>|</small>
                                发表时间
                                <small class="time">{$vo.create_time}</small>
                            </p>
                        </div>
                    </div>
                </div>
                <div class="well-content">
                    {$vo.content}
                </div>
            </div>
        {/volist}
    </div>
    <div class="comments-pager text-center">
        {$comments_page}
    </div>
    <!--评论-->
    {eq name="_user.id" value='-1'}
        <div class="row post-box well animated animated-quick slideInUp">
            <div class="row text-center">
                <h1>想回复帖子,请您先 <a href="{:url('portal/login')}">登陆</a> 系统!!!</h1>
            </div>
        </div>
    {else/}
        <div class="post-box  animated animated-quick slideInUp">
            <form id="commentForm" action="{:url('bbs.post/comment')}" method="post">
                <input type="hidden" name="post_id" value="{$data.id}">
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
    {/eq}
    <script>

    </script>
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

            $('#commentForm').submit(function (e) {
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