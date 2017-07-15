{extend name="base/common"}
{block name="body"}
    <div class="container-fluid" id="config-app">
        <div class="row data-list-header-action">
            <button type="button" class="btn btn-danger hidden" v-on:click="addShow">新增(开发者操作域)</button>
            <button type="button" class="btn btn-danger " v-on:click="updateCache">更新缓存</button>
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
                            <form method="post">
                                <input type="hidden" name="id" v-model="tmp_model.id">
                                <div class="form-group">
                                    <label for="" class="control-label">标题</label>
                                    <input type="text" name="title" class="form-control" v-model="tmp_model.title">
                                </div>
                                <div class="form-group">
                                    <label for="" class="control-label">用途</label>
                                    <input type="text" class="form-control" v-model="tmp_model.mark">
                                </div>
                                <div class="form-group">
                                    <label for="" class="control-label">Key</label>
                                    <input type="text"
                                           class="form-control "
                                           :class="tmp_model.method=='edit'? 'disabled':''"
                                           readonly
                                           v-model="tmp_model.key">
                                </div>
                                <div class="form-group">
                                    <label for="" class="control-label">Value</label>
                                    <input type="text" class="form-control" v-model="tmp_model.value">
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
            <table class="table-bordered table table-responsive table-hover">
                <thead>
                <tr>
                    <th>编号</th>
                    <th>名称</th>
                    <th>用途</th>
                    <th>Key</th>
                    <th>Value</th>
                    <th style="width: 10%">操作</th>
                </tr>
                </thead>
                <tbody>
                <tr v-for="vo in data_list">
                    <td><span v-html="vo.id"></span></td>
                    <td><span v-html="vo.title"></span></td>
                    <td><span v-html="vo.mark"></span></td>
                    <td><span v-html="vo.key"></span></td>
                    <td><span v-html="vo.value"></span></td>
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
                    tmp_model: {
                        method: 'add',
                        modal_title: "新增",
                        //model
                        id: null
                    },
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
                        $.post("{:url('system.config/getConfigList')}",{page:pageNum}, function (ret) {
                            ret.data.data_list.data.forEach(function (item) {
                                self.data_list.push(item);
                            });
                            //分页
                            self.pagination.current_page = ret.data.data_list.current_page;
                            self.pagination.last_page = ret.data.data_list.last_page;
                            self.pagination.per_page = ret.data.data_list.per_page;
                            self.pagination.total = ret.data.data_list.total;
                        });
                    },
                    addShow: function () {
                        this.tmp_model.modal_title = "新增";
                        this.tmp_model.method = "add";
                        this.tmp_model.id = null;

                        $('#addEditModel').modal('toggle');

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
                            $.post("{:url('system.config/delConfig')}",{id:id}, function (ret) {
                                layer.msg(ret.msg);
                                self.loadData();
                            });
                        }, function () {
                            layer.msg("用户删除取消");
                        })
                    },
                    sureAddEdit: function () {
                        var self = this;
                        $.post("{:url('system.config/addEditConfig')}", self.tmp_model, function (ret) {
                            $('#addEditModel').modal('toggle');
                            self.loadData();
                            layer.msg(ret.msg);
                        });
                    },
                    updateCache: function () {
                        $.get("{:url('system.config/updateCache')}", function (ret) {
                            layer.msg(ret.msg);
                        });
                    }
                },
                mounted: function () {
                    this.loadData();
                }
            })

        });
    </script>
{/block}