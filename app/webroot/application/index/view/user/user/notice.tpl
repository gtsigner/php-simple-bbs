{extend name="base/common"}
{block name="body"}
    <div class="page-notice">
        <div class="row">
            <ul class="list-group list-unstyled">
                {eq name="data_list|count" value="0"}
                    <li class="list-group-item">
                        <span>对不起,这里没有任何数据</span>
                    </li>
                {/eq}
                {volist name="data_list" id="vo"}
                    <li>
                        <span>{$vo.content}</span>
                    </li>
                {/volist}
            </ul>
            <div class="page text-center">
                {$page}
            </div>
        </div>
    </div>
{/block}