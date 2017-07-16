{extend name="base/common"}
{block name="body"}
    <div class="container-fluid" id="config-app">
        <div class="row data-list-header-action">
            <button type="button" class="btn btn-success" v-on:click="addShow">新增</button>
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
                            <form action="{:url('system.config/addFriendLinks')}" method="post">
                                <input type="hidden" name="id" v-model="tmp_model.id">
                                <div class="form-group">
                                    <label for="" class="control-label">称号</label>
                                    <input type="text" name="name" class="form-control" v-model="tmp_model.name">
                                </div>
                                <div class="form-group">
                                    <label for="" class="control-label">级别</label>
                                    <input type="number" name="level" class="form-control" v-model="tmp_model.level">
                                </div>
                                <div class="form-group">
                                    <label for="" class="control-label">所需经验</label>
                                    <input type="number" name="score" class="form-control" v-model="tmp_model.score">
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
                    <th>所需经验</th>
                    <th>用户称号</th>
                    <th>用户级别</th>
                    <th style="width: 10%">操作</th>
                </tr>
                </thead>
                <tbody>
                <tr v-for="vo in data_list">
                    <td><span v-html="vo.id"></span></td>
                    <td><span v-html="vo.score"></span></td>
                    <td><label class="label label-danger" v-html="vo.name"></label></td>
                    <td><label class="badge bg-danger" v-html="vo.level"></label></td>
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
                        id: null,
                        title: '',
                        sort: 0,
                        mark: ''
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
                        $.post("{:url('system.userLevel/getUserLevel')}",{page:pageNum}, function (ret) {
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
                        this.tmp_model ={};
                        this.tmp_model.modal_title = "新增";
                        this.tmp_model.method = "add";
                        this.tmp_model.id = null;
                        this.tmp_model.title = "";
                        this.tmp_model.sort = 0;
                        this.tmp_model.mark = "";

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
                            $.post("{:url('system.userLevel/delUserLevel')}",{id:id}, function (ret) {
                                layer.msg(ret.msg);
                                self.loadData();
                            });
                        }, function () {
                            layer.msg("用户删除取消");
                        })
                    },
                    sureAddEdit: function () {
                        var self = this;
                        $.post("{:url('system.userLevel/addEditUserLevel')}", self.tmp_model, function (ret) {
                            $('#addEditModel').modal('toggle');
                            self.loadData();
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