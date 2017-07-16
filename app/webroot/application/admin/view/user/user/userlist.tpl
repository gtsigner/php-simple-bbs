{extend name="base/common"}
{block name="body"}
    <div class="container-fluid" id="user-list-app">
        <div class="row data-list-header-action">
            <button type="button" class="btn btn-success hidden" v-on:click="add">新增用户
            </button>
            <button type="button" class="btn btn-danger hidden">批量删除</button>
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
                            <h4 class="modal-title" v-html="tmp_model.modal_title">新增用户</h4>
                        </div>
                        <div class="modal-body">
                            <form method="post">
                                <div class="form-group">
                                    <label for="" class="control-label">用户名</label>
                                    <input type="text" name="username" class="form-control disabled"
                                           v-model="tmp_model.username" readonly>
                                </div>
                                <div class="form-group">
                                    <label for="" class="control-label">昵称</label>
                                    <input type="text" name="nickname" class="form-control"
                                           v-model="tmp_model.nickname">
                                </div>
                                <div class="form-group">
                                    <label for="" class="control-label">密码</label>
                                    <input type="password" name="password" class="form-control"
                                           v-model="tmp_model.password">
                                </div>
                                <div class="form-group">
                                    <label for="" class="control-label">积分</label>
                                    <input type="number" name="level_score" class="form-control"
                                           v-model="tmp_model.level_score">
                                </div>
                                <div class="form-group">
                                    <label for="" class="control-label">经验</label>
                                    <input type="number" name="experience" class="form-control"
                                           v-model="tmp_model.experience">
                                </div>
                                <div class="form-group">
                                    <label for="" class="control-label">备注</label>
                                    <textarea name="mark" class="form-control" v-model="tmp_model.mark"></textarea>
                                </div>
                                <div class="form-group">
                                    <label for="" class="control-label">权限分组</label>
                                    <div class="well">
                                        <ul class="list-inline">
                                            <li v-for="gp in groups">
                                                <input type="checkbox" v-model="tmp_model.groups_id"
                                                       :value="gp.id">
                                                <span v-html="gp.title"></span>
                                            </li>
                                        </ul>
                                    </div>
                                </div>
                            </form>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                            <button type="button" class="btn btn-primary" v-on:click="addEditUser">确认</button>
                        </div>
                    </div>
                </div>
            </div>

            <table class="table-bordered table table-responsive table-hover text-center">
                <thead>
                <tr>
                    <th><input type="checkbox" name="check-all" class="checkbox check-all"></th>
                    <th>编号</th>
                    <th>用户账号</th>
                    <th>昵称</th>
                    <th>用户权限组</th>
                    <th>积分</th>
                    <th>经验</th>
                    <th>用户等级</th>
                    <th>状态</th>
                    <th style="width: 10%">操作</th>
                </tr>
                </thead>
                <tbody>
                <tr v-for="vo in data_list">
                    <td><input type="checkbox" class="checkbox check-item" name="id[]" :value="vo.id"></td>
                    <td><span v-html="vo.id"></span></td>
                    <td><span v-html="vo.username"></span></td>
                    <td><span v-html="vo.nickname"></span></td>
                    <td>
                        <span class="text-success" v-if="vo.auth_group" v-for="group in vo.auth_group"
                              v-html="group.authGroup.title+'，'"></span>
                        <span class="text-danger" v-if="vo.auth_group.length<=0">无任何权限</span>
                    </td>
                    <td><span v-html="vo.score"></span></td>
                    <td><span v-html="vo.experience"></span></td>
                    <td><span v-html="vo.level"></span></td>
                    <td><label class="label cursor-pointer"
                               :class="vo.status===1?'label-success':'label-danger'"
                               v-on:click="changeStatus(vo)"
                               v-html="vo.status===1?'开启':'关闭'"></label></td>
                    </td>
                    <td>
                        <button type="button" class="btn btn-sm btn-primary" v-on:click="edit(vo)">编辑
                        </button>
                        <button type="button" class="btn btn-sm btn-danger" v-on:click="deleteUser(vo.id)">删除
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
        require(['vue', 'axios', 'layer', 'vuePager'], function (Vue, axios, layer, vuePager) {
            Vue.component('paginate', vuePager)
            var app = new Vue({
                el: "#user-list-app",
                data: {
                    data_list: [],
                    tmp_model: {
                        method: 'add',
                        modal_title: "新增",
                        //model
                        username: '',
                        nickname: '',
                        password: '',
                        level_score: 0,
                        experience: 0,
                        status: 0,
                        sort: 0,
                        mark: ''
                    },
                    pagination: {
                        current_page: 0,
                        last_page: 0,
                        per_page: 0,
                        total: 0
                    },
                    groups: []
                },
                methods: {
                    loadData: function (pageNum) {
                        if (pageNum) {
                            this.pagination.current_page = pageNum;
                        } else {
                            pageNum = this.pagination.current_page;
                        }
                        console.log(pageNum);
                        var search = {
                            status: "{:input('status',-1,'intval')}"
                        };
                        var self = this;
                        self.data_list = [];
                        $.post("{:url('user.user/getUserList')}",{page:pageNum,status:search.status}, function (rep) {
                            rep.data.data_list.data.forEach(function (item) {
                                self.data_list.push(item);
                            });
                            //分页
                            self.pagination.current_page = rep.data.data_list.current_page;
                            self.pagination.last_page = rep.data.data_list.last_page;
                            self.pagination.per_page = rep.data.data_list.per_page;
                            self.pagination.total = rep.data.data_list.total;
                        });
                    },
                    add: function () {
                        this.tmp_model.modal_title = "新增";
                        this.tmp_model.method = "add";
                        $('#addEditModel').modal('toggle');
                    },
                    edit: function (vo) {
                        this.tmp_model = vo;
                        this.tmp_model.modal_title = "编辑";
                        this.tmp_model.method = "edit";
                        $('#addEditModel').modal('toggle');
                    },
                    getDataList: function () {

                    },
                    statusUser: function (id) {

                    },
                    changeStatus: function (vo) {
                        var self = this;
                        $.post("{:url('user.user/changeStatus')}",{id:vo.id}, function (ret) {
                            if (ret.code === 1) {
                                vo.status = vo.status === 1 ? 0 : 1;
                            }
                        });
                    },
                    deleteUser: function (id) {
                        var self = this;
                        layer.confirm("确认删除用户?", function () {
                            $.post("{:url('user.user/delete')}", {id:id}, function (response) {
                                layer.msg(response.msg);
                                self.loadData();
                            });
                        }, function () {
                            layer.msg("操作取消");
                        })
                    },
                    addEditUser: function () {
                        var self = this;
                        layer.confirm("确认操作此数据?", function () {
                            $.post("{:url('user.user/addEditUser')}", self.tmp_model, function (ret) {
                                layer.msg(ret.msg);
                                if (ret.code === 200) {
                                    self.loadData(1);
                                    $('#addEditModel').modal('toggle');
                                }
                            });
                        }, function () {
                            layer.msg("操作取消");
                        })
                    },
                    loadAllGroups: function () {
                        var self = this;
                        $.get("{:url('auth/getAllGroups')}", function (ret) {
                            ret.data.data_list.forEach(function (item) {
                                self.groups.push(item);
                            });
                        });
                    }
                },
                mounted: function () {
                    // this.getDataList();
                    this.loadAllGroups();
                    this.loadData();
                }
            })

        });
    </script>
{/block}