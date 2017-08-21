{extend name="base/common"}
{block name="pre_head"}
    <script src="__STATIC__/libs/editor.md/lib/raphael.min.js"></script>
    <link rel="stylesheet" href="__STATIC__/libs/editor.md/css/editormd.min.css">
{/block}

{block name="body"}
    <link href="http://github.com/yrgoldteeth/darkdowncss/raw/master/darkdown.css" rel="stylesheet"/>
    <div class="page-post-detail">
        <div class="post-detail">
            <div class="row">
                <div class="detail-box">
                    <div class="post-detail-header row">
                        <div class="col-xs-10">
                            <h2 class="text-left post-title">{$data.title}</h2>
                            <ul class="list-inline post-tag-box">
                                <li class="tags-box">
                                    Tags：<span class="badge new-badge success">php</span>
                                    <span class="badge new-badge success">Java</span>
                                    <span class="badge new-badge success">c#</span>
                                </li>
                                <li>
                                    <!-- href="{:url('user.user/show',['user_id'=>$data['user']['id']])}"-->
                                    <a class="author">{$data.user.nickname|default='已删除'}</a>
                                    <span>{:date("Y年m月d日",strtotime($data.create_time))}发布</span>
                                    {eq name="data.user_id" value="$_user.id"}
                                        *
                                        <a href="{:url('bbs.post/editPost',['id'=>$data['id']])}" class="author">编辑</a>
                                        *
                                        <a href="{:url('bbs.post/delete',['id'=>$data['id']])}"
                                           class="text-danger">删除</a>
                                    {/eq}
                                </li>
                                <li>

                                </li>
                            </ul>
                        </div>
                        <div class="col-xs-2">
                            <button class="btn btn-success">赞 | <span>0</span></button>
                            <button class="btn btn-default">收藏 | <span>0</span></button>
                        </div>
                    </div>
                    <div class="content row article-content markdown-body"
                         style="overflow: hidden;text-overflow: ellipsis;text-wrap: normal;white-space: normal">
                        <html>
                        {$data.content}
                        </html>
                    </div>
                </div>
            </div>
            <div class="row post-comments-total">
                <div class="col-xs-3">
                    <h3><span>{$data->comments()->count()}</span>条评论</h3>
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
                                    {$vo.user.userProfile|getUserLevel}
                                    <small>|</small>
                                    发表时间
                                    <small class="time">{$vo.create_time}</small>
                                    {eq name="vo.user.id" value="$_user.id"}
                                        <a href="{:url('index/bbs.post/editComment',['id'=>$vo['id']])}" class=""
                                           style="margin-left: 20px">编辑修改</a>
                                    {/eq}
                                </p>
                            </div>
                        </div>
                    </div>
                    <div class="well-content comment-content markdown-body">
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
                <h4>撰写答案</h4>
                <form id="commentForm" class="form" action="{:url('bbs.post/comment')}" method="post">
                    <input type="hidden" name="post_id" value="{$data.id}">
                    <div class="form-group">
                        <div class="" id="postContent">
                            <textarea class="editormd-markdown-textarea" name="postContent-markdown-doc"></textarea>
                            <!-- html textarea 需要开启配置项 saveHTMLToTextarea == true -->
                            <textarea class="editormd-html-textarea" name="postContent-html-code"></textarea>
                        </div>
                    </div>
                    <div class="form-group">
                        <button type="submit" class="btn btn-success btn-lg">确认回复</button>
                    </div>
                </form>
            </div>
        {/eq}
    </div>
    <script>
        seajs.use(['editormd', 'layer'], function () {
            var editormd = seajs.require('editormd');
            var editor = editormd({
                id: "postContent",
                height: 320,
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

        seajs.use(['layer'], function () {

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
                    layer.msg(ret.msg);
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