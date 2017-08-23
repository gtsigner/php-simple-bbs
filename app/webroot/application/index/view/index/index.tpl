{extend name="base/common"}
{block name="body"}
    <div class="page-bbs">
        <div class="row post-list-box">
            <table class="table">
                <thead class="">
                <tr>
                    <th class="text-left"><label for="">标题</label></th>
                    <th><label for="">栏目</label></th>
                    <th><label for="">作者</label></th>
                    <th><label for="">更新时间</label></th>
                    <th><label for="">访问量</label></th>
                    <th><label for="">推荐</label></th>
                </tr>
                </thead>
                <tbody>
                {eq name="data_list|count" value="0"}
                    <tr>
                        <td class="text-center text-danger" colspan="20">对不起,该栏目还没有任何帖子信息</td>
                    </tr>
                {/eq}
                {volist name="data_list" id="vo"}
                    <tr>
                        <td class="text-left" style="width: 50%">
                            <p class="index-post-title">
                                {eq name="vo.position" value="2"}
                                    <label class="label label-success">置顶</label>
                                {/eq}
                                {eq name="vo.position" value="1"}
                                    <label class="label label-primary">推荐</label>
                                {/eq}
                                <a href="/post/{$vo.id}.html">{$vo.title}</a>
                            </p>
                        </td>
                        <td>
                            <a href="/category/{$vo['category']['id']}.html">{$vo.category.title|default='<span class="text-danger">已删除</span>'}</a>
                        </td>
                        <td>
                            <a href="/user/{$vo['user']['id']}.html">{$vo.user.username|default='<span class="text-danger">已删除</span>'}</a>
                        </td>
                        <td>{$vo.update_time|checkDateDefault|default='未有更新'}</td>
                        <td>{$vo.view_count}</td>
                        <td>{$vo.re_count}</td>
                    </tr>
                {/volist}
                </tbody>
            </table>
            <div class="page text-center">
                {$page}
            </div>
        </div>
        {empty name="_user.username"}
            <div class="row post-box well animated">
                <div class="row text-center">
                    <h1>想发帖,请您先 <a href="{:url('portal/login')}">登陆</a> 系统!!!</h1>
                </div>
            </div>
        {else/}

        {/empty}
    </div>
{/block}