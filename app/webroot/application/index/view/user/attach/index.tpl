{extend name="base/common"}
{block name="category"}
{/block}
{block name="body"}
    <div class="page row">
        <div class="col-xs-6">
            {$page}
        </div>
        <div class="col-xs-6 text-left">
            <h3 class="text-left">我的附件</h3>
        </div>
    </div>
    <div class="row post-list-box">
        <table class="table text-center">
            <tr class="text-center">
                <td><label>ID</label></td>
                <td><label>附件名称</label></td>
                <td><label>附件描述</label></td>
                <td><label>文件大小</label></td>
                <td><label>兑换时间</label></td>
                <td><label>文件更新时间</label></td>
                <td><label>消费积分</label></td>
                <td><label>操作</label></td>
            </tr>
            <tbody>
            {eq name="data_list|count" value="0"}
                <tr>
                    <td colspan="20" class="text-center"><span class="text-danger">对不起,您还没有使用积分兑换附件</span></td>
                </tr>
            {/eq}
            {volist name="data_list" id="vo"}
                <tr class="text-center">
                    <td style="width: 80px">{$vo.id}</td>
                    <td class="text-center">
                        <p class="overflow-title-els">
                            <span class="cursor-pointer text-success">{$vo.file.title|default='已删除'}</span>
                        </p>
                    </td>
                    <td>
                        <span>{$vo.file.desc|default='已删除'}</span>
                    </td>
                    <td>
                        <span>{$vo.file.size|default='已删除'}</span>
                    </td>
                    <td>{$vo.create_time}</td>
                    <td>{$vo.file.update_time|checkDateDefault|default='无'}</td>
                    <td>{$vo.pay_amount}</td>
                    <td>{empty name="vo.file"}
                            <span>已删除</span>
                        {else/}
                            <a class="download-btn cursor-pointer"
                               data-score="{$vo.file.need_score}"
                               data-href="{:url('attach.file/download',['id'=>$vo['file']['id']])}">点击下载</a>
                        {/empty}
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
        require(['jquery', 'layer'], function ($, layer) {

            $(".download-btn").click(function (e) {
                e.preventDefault();
                var $this = $(this);
                var score = $this.attr("data-score");
                window.open($this.attr('data-href'));
            });
        });
    </script>
{/block}