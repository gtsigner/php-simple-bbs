{extend name="base/common"}
{block name="body"}
    <div class="page row">
        <div class="col-xs-8">
            {$page}
        </div>
    </div>
    <div class="row post-list-box">
        <table class="table table-hover text-center">
            <thead class="">
            <tr>
                <td><label for="">ID</label></td>
                <td class="text-left"><label for="">标题</label></td>
                <td><label for="">栏目</label></td>
                <td><label for="">作者</label></td>
                <td><label for="">回复量</label></td>
                <td><label for="">访问量</label></td>
                <td><label for="">更新时间</label></td>
                <td><label for="">推荐</label></td>
            </tr>
            </thead>
            <tbody>
            {eq name="data_list|count" value="0"}
                <tr>
                    <td class="text-center text-danger" colspan="20">对不起,该栏目还没有任何帖子信息</td>
                </tr>
            {/eq}
            {volist name="data_list" id="vo"}
                <tr class="text-center">
                    <td style="width: 80px">{$vo.id}</td>
                    <td class="text-left">
                        <p class="index-post-title"><a
                                    href="{:url('bbs.post/detail',['id'=>$vo['id']])}">{$vo.title}</a>
                        </p>
                    </td>
                    <td>
                        <a href="{:url('index/index/index',['category'=>$vo['category']['id']])}">{$vo.category.title|default='<span class="text-danger">已删除</span>'}</a>
                    </td>
                    <td>
                        <p class="no-padding no-margin">{$vo.user.username|default='已删除'}</p>
                        <p class="no-padding no-margin">{$vo.create_time}</p>
                    </td>
                    <td>{$vo.comments|count}</td>
                    <td>{$vo.view_count}</td>
                    <td>{$vo.update_time|checkDateDefault|default='未有更新'}</td>
                    <td>{$vo.recommend_count}</td>
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
    {empty name="_user.username"}
        <div class="row post-box well animated">
            <div class="row text-center">
                <h1>想发帖,请您先 <a href="{:url('portal/login')}">登陆</a> 系统!!!</h1>
            </div>
        </div>
    {else/}

    {/empty}
{/block}