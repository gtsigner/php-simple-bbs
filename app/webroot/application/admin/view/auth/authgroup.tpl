{extend name="base/common"}
{block name="body"}
    <div class="container-fluid" id="config-app">
        <div class="row data-list-header-action">
            <button type="button" class="btn btn-success" v-on:click="addShow">新增分组
            </button>
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
                                    <label for="" class="control-label">标题</label>
                                    <input type="text" name="title" class="form-control" v-model="tmp_model.title">
                                </div>
                                <div class="form-group">
                                    <label for="" class="control-label">备注</label>
                                    <input type="text" name="url" class="form-control" v-model="tmp_model.mark">
                                </div>
                                <div class="form-group">
                                    <label for="" class="control-label">选择权限</label>
                                    <div class="well">
                                        <ul class="list-inline">
                                            <li v-for="rule in rules" style="min-width: 200px;">
                                                <input type="checkbox" v-model="tmp_model.rules"
                                                       :value="rule.id">
                                                <span :class="{'text-danger':rule.module==='admin'}"
                                                      v-html="rule.module+':'+rule.title"></span>
                                            </li>
                                        </ul>
                                    </div>
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
                    <th>访问权限</th>
                    <th>备注</th>
                    <th style="width: 10%">操作</th>
                </tr>
                </thead>
                <tbody>
                <tr v-for="vo in data_list">
                    <td><span v-html="vo.id"></span></td>
                    <td><span v-html="vo.title"></span></td>
                    <td class="overflow-title-els" width="50%">
                        <span v-for="rule in vo.rules_show" v-html="rule.module+':'+rule.title+'，'"></span>
                    </td>
                    <td><span v-html="vo.mark"></span></td>
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
                        rules: [0]
                    },
                    pagination: {
                        current_page: 0,
                        last_page: 0,
                        per_page: 0,
                        total: 0
                    },
                    rules: []
                },
                filters: {
                    getTitle: function (ruleID) {

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
                        $.post("{:url('auth/getAuthGroups')}",{page:pageNum}, function (ret) {
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
                    loadRules: function () {
                        var self = this;
                        $.get("{:url('auth/getAllRules')}", function (ret) {
                            ret.data.data_list.forEach(function (item) {
                                self.rules.push(item);
                            });
                        });
                    },
                    addShow: function () {
                        this.tmp_model = {};
                        this.tmp_model.modal_title = "新增规则";
                        this.tmp_model.method = "add";
                        this.tmp_model.id = null;
                        this.tmp_model.title = "";
                        this.tmp_model.rules = [];
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
                            $.post("{:url('auth/delAuthGroup')}",{id:id}, function (ret) {
                                layer.msg(ret.msg);
                                self.loadData();
                            });
                        }, function () {
                            layer.msg("用户删除取消");
                        })
                    },
                    sureAddEdit: function () {
                        var self = this;
                        console.log(self.tmp_model);
                        $.post("{:url('auth/addEditAuthGroup')}", self.tmp_model, function (ret) {
                            $('#addEditModel').modal('toggle');
                            self.loadData();
                            layer.msg(ret.msg);
                        });
                    }
                },
                mounted: function () {
                    this.loadData();
                    this.loadRules();
                }
            })

        });
    </script>
{/block}