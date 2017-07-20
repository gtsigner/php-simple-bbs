{extend name="base/common"}
{block name="category"}
{/block}
{block name="body"}
    <div class="page row">
        <div class="col-xs-8">
            {$page}
        </div>
    </div>
    <div class="row post-list-box">
        <table class="table text-center">
            <tr class="text-center">
                <td><label>ID</label></td>
                <td><label>附件名称</label></td>
                <td><label>附件描述</label></td>
                <td><label>文件类型</label></td>
                <td><label>文件大小</label></td>
                <td><label>发布时间</label></td>
                <td><label>更新时间</label></td>
                <td><label>下载量</label></td>
                <td><label>需要积分</label></td>
                <td><label>操作</label></td>
            </tr>
            <tbody>
            {volist name="data_list" id="vo"}
                <tr class="text-center">
                    <td style="width: 80px">{$vo.id}</td>
                    <td class="text-center">
                        <p class="overflow-title-els">
                            <a class="download-btn cursor-pointer"
                               data-score="{$vo.need_score}"
                               data-id="{$vo.id}"
                               data-href="{:url('attach.file/download',['id'=>$vo['id']])}">{$vo.title}</a>
                        </p>
                    </td>
                    <td>
                        <p class="overflow-title-els">{$vo.desc|default='无描述'}</p>
                    </td>
                    <td>{$vo.type}</td>
                    <td>{$vo.size}</td>
                    <td>{$vo.create_time}</td>
                    <td>{$vo.update_time|checkDateDefault|default='无'}</td>
                    <td>{$vo.download_count}</td>
                    <td>
                        <span class="text-danger">
                        {eq name="vo.need_score" value="0"}
                            免费
                        {else/}
                        {$vo.need_score}&nbsp;分
                        {/eq}
                        </span>
                    </td>
                    <td>
                        {eq name="_user.id" value='-1'}
                            <span>登陆后可下载</span>
                        {else/}
                            <a class="download-btn cursor-pointer"
                               data-score="{$vo.need_score}"
                               data-id="{$vo.id}"
                               data-href="{:url('attach.file/download',['id'=>$vo['id']])}">点击下载</a>
                        {/eq}
                    </td>
                </tr>
            {/volist}
            </tbody>
        </table>
    </div>
    <div class="page row">
        <div class="col-xs-8">
            {$page}
        </div>
        <div class="col-xs-4">

        </div>
    </div>
    <script>
        seajs.use((['jquery', 'layer'], function ($, layer) {

            $(".download-btn").click(function (e) {
                e.preventDefault();
                var $this = $(this);
                var score = $this.attr("data-score");
                var attach_id = $this.attr("data-id");
                layer.confirm("您确认下载此文件么？系统将扣除您" + score + "个积分，如果您已经下载过了，请到我得附件查看！！", function () {
                    $.post("{:url('attach.file/buy')}", {id: attach_id}, function (ret) {
                        layer.alert(ret.msg);
                        //扣除积分
                        if (ret.code === 1) {
                            window.open($this.attr('data-href'));
                        }
                    });

                }, function () {

                });
            });
        });
    </script>
{/block}