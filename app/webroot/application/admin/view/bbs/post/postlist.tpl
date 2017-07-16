{extend name="base/common"}
{block name="body"}
    <div class="container-fluid" id="config-app">


        <div class="row panel panel-default">
            <div class="panel-heading">
                <h3 class="panel-title">搜索</h3>
            </div>
            <div class="panel-body">
                <form action="" class="form form-inline">
                    <div class="form-group">
                        <label for="" class="control-label">所属栏目：</label>
                        <select class="form-control" v-model="search.category">
                            <option value="0">全部内容</option>
                            <option value="" v-for="cate in category" :value="cate.id"
                                    v-html="cate.title"></option>
                        </select>
                    </div>
                    <div class="form-group">
                        <button type="button" v-on:click="loadData()" class="btn btn-success">搜索</button>
                    </div>
                </form>
            </div>
        </div>
        <div class="row data-list-header-action">
            <button type="button" class="btn btn-danger" v-on:click="delMore">批量删除</button>
        </div>
        <div class="row">
            <!--增加modal-->
            <div class="modal fade" id="addEditModel" tabindex="-1" role="dialog"
                 aria-labelledby="myLargeModalLabel">
                <div class="modal-dialog modal-lg" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                                        aria-hidden="true">&times;</span></button>
                            <h4 class="modal-title" v-html="tmp_model.modal_title"></h4>
                        </div>
                        <div class="modal-body">
                            <form action="{:url('bbs.post/addEdit')}" method="post">
                                <input type="hidden" name="id" v-model="tmp_model.id">
                                <div class="form-group">
                                    <label for="" class="control-label">标题</label>
                                    <input type="text" name="title" class="form-control disabled" readonly
                                           v-model="tmp_model.title">
                                </div>
                                <div class="form-group">
                                    <label for="" class="control-label">所属栏目</label>
                                    <select class="form-control" name="category_id" id=""
                                            v-model="tmp_model.category_id">
                                        <option value="" v-for="cate in category" :value="cate.id"
                                                v-html="cate.title"></option>
                                    </select>
                                </div>
                                <div class="form-group">
                                    <label for="" class="control-label">排序(小号在前)</label>
                                    <input type="number" name="sort" class="form-control" v-model="tmp_model.sort">
                                </div>
                                <div class="form-group">
                                    <label for="" class="control-label">备注</label>
                                    <textarea name="mark" class="form-control" v-model="tmp_model.mark"></textarea>
                                </div>
                            </form>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                            <button type="button" class="btn btn-primary" v-on:click="sureAddEdit">确认</button>
                        </div>
                    </div>
                </div>
            </div>


            <table class="table-bordered table table-responsive table-hover text-center">
                <thead>
                <tr>
                    <th><input type="checkbox"></th>
                    <th>编号</th>
                    <th>排序</th>
                    <th>标题</th>
                    <th>所属栏目</th>
                    <th>发表用户</th>
                    <th>发帖时间</th>
                    <th>回复量</th>
                    <th>访问量</th>
                    <th>状态</th>
                    <th style="width: 10%">操作</th>
                </tr>
                </thead>
                <tbody>
                <tr v-for="vo in data_list">
                    <td><input type="checkbox"></td>
                    <td><span v-html="vo.id"></span></td>
                    <td><span v-html="vo.sort"></span></td>
                    <td><span v-html="vo.title"></span></td>
                    <td><a target="_blank" v-if="vo.category"
                           :href="'{:url('bbs.post/postList')}?category='+vo.category.id">
                            <span v-html="vo.category.title"></span></a>
                        <span v-else="vo.category">已删除</span>
                    </td>
                    <td><span v-if="vo.user" v-html="vo.user.nickname"></span></td>
                    <td><span v-html="vo.create_time"></span></td>
                    <td><span v-html="vo.comments_count"></span></td>
                    <td><span v-html="vo.view_count"></span></td>
                    <td><label class="label cursor-pointer"
                               :class="vo.status===1?'label-success':'label-danger'"
                               v-on:click="changeStatus(vo)"
                               v-html="vo.status===1?'已审核':'未审核'"></label></td>
                    <td>
                        <button type="button" class="btn btn-sm btn-primary" v-on:click="edit(vo)">编辑</button>
                        <button type="button" class="btn btn-sm btn-danger" v-on:click="del(vo.id)">删除
                        </button>
                    </td>
                </tr>
                </tbody>
            </table>
            <div class="pager">
                <paginate
                        :page-count="pagination.last_page"
                        :click-handler="loadData"
                        :prev-text="'上一页'"
                        :next-text="'下一页'"
                        :container-class="'pagination'">
                </paginate>
            </div>
        </div>
    </div>
    <script>

        require(['vue', 'layer', 'vuePager'], function (Vue, layer, vuePager) {
            Vue.component('paginate', vuePager);
            var app = new Vue({
                el: "#config-app",
                data: {
                    data_list: [],
                    search: {
                        category: 0,
                    },
                    tmp_model: {
                        method: 'add',
                        modal_title: "新增",
                        //model
                        id: null,
                        title: '',
                        sort: 0,
                        mark: ''
                    },
                    category: [],
                    pagination: {
                        current_page: 0,
                        last_page: 0,
                        per_page: 0,
                        total: 0
                    }
                },
                methods: {
                    loadData: function (pageNum) {
                        var self = this;
                        if (pageNum) {
                            this.pagination.current_page = pageNum;
                        } else {
                            pageNum = this.pagination.current_page;
                        }
                        self.data_list = [];
                        $.post("{:url('bbs.post/getList')}",{page:pageNum,search:self.search}, function (ret) {
                            ret.data.data_list.data.forEach(function (item) {
                                item.checked = false;
                                self.data_list.push(item);
                            });
                            //分页
                            self.pagination.current_page = ret.data.data_list.current_page;
                            self.pagination.last_page = ret.data.data_list.last_page;
                            self.pagination.per_page = ret.data.data_list.per_page;
                            self.pagination.total = ret.data.data_list.total;
                        });
                    },
                    edit: function (vo) {
                        //写入模型
                        this.tmp_model = vo;
                        this.tmp_model.modal_title = "编辑";
                        this.tmp_model.method = "edit";
                        $('#addEditModel').modal('toggle');
                    },
                    del: function (id) {
                        var self = this;
                        layer.confirm("确认删除么(不可恢复)",{}, function () {
                            $.post("{:url('bbs.post/del')}",{id:id}, function (ret) {
                                layer.msg(ret.msg);
                                self.loadData();
                            });
                        }, function () {
                            layer.msg("用户删除取消");
                        })
                    },
                    delMore: function () {

                    },
                    loadCategory: function () {
                        var _self = this;
                        $.get("{:url('bbs.category/getCategory')}", function (ret) {
                            ret.data.forEach(function (item) {
                                _self.category.push(item);
                            });
                        });
                    },
                    changeStatus: function (vo) {
                        var self = this;
                        $.post("{:url('bbs.post/changeStatus')}",{id:vo.id}, function (ret) {
                            if (ret.code === 1) {
                                vo.status = vo.status === 1 ? 0 : 1;
                            }
                        });
                    },
                    sureAddEdit: function () {
                        var self = this;
                        //保存
                        $.post("{:url('bbs.post/addEdit')}", self.tmp_model, function (ret) {
                            $('#addEditModel').modal('toggle');
                            self.loadData();
                            layer.msg(ret.msg);
                        });
                    }
                },
                mounted: function () {
                    this.loadCategory();
                    this.loadData();
                }
            })

        });
    </script>
{/block}