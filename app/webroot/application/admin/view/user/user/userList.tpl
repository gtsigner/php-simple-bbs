{extend name="base/common"}
{block name="body"}
    <div class="container-fluid" id="user-list-app">
        <div class="row data-list-header-action">
            <button type="button" class="btn btn-success" v-on:click="add">新增用户
            </button>
            <button type="button" class="btn btn-danger">批量删除</button>
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
                            <form action="{:url('user.user/addUser')}" method="post">
                                <div class="form-group">
                                    <label for="" class="control-label">用户名</label>
                                    <input type="text" name="username" class="form-control"
                                           v-model="tmp_model.username">
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
                            </form>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                            <button type="button" class="btn btn-primary" v-on:click="addUser">确认新增</button>
                        </div>
                    </div>
                </div>
            </div>

            <table class="table-bordered table table-responsive table-hover">
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
                    <td><span v-html="vo.auth_group"></span></td>
                    <td><span v-html="vo.level_score"></span></td>
                    <td><span v-html="vo.experience"></span></td>
                    <td><span v-html="vo.level"></span></td>
                    <td>
                        <label class="label label-default" v-html="vo.status"
                               v-on:click="statusUser(vo.id)"></label>
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
                    }
                },
                methods: {
                    loadData: function (pageNum) {
                        if (pageNum) {
                            this.pagination.current_page = pageNum;
                        } else {
                            pageNum = this.pagination.current_page;
                        }
                        console.log(pageNum);
                        var self = this;
                        self.data_list = [];
                        $.post("{:url('user.user/getUserList')}",{page:pageNum}, function (rep) {
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
                    deleteUser: function (id) {
                        var self = this;
                        layer.confirm("确认删除用户?", function () {
                            $.post("{:url('user.user/delete')}", {id:id}, function (response) {
                                layer.msg(response.msg);
                                self.loadData();
                            });
                        }, function () {
                            layer.msg("用户删除取消");
                        })
                    },
                    addUser: function () {
                        var self = this;
                        layer.confirm("确认添加此用户?", function () {
                            $.post("{:url('user.user/addUser')}", self.tmp_model, function (ret) {
                                layer.msg(ret.msg);
                                if (ret.code === 200) {
                                    self.loadData(1);
                                    $('#addEditModel').modal('toggle');
                                }
                            });
                        }, function () {
                            layer.msg("用户新增取消");
                        })
                    }
                },
                mounted: function () {
                    // this.getDataList();
                    this.loadData();
                }
            })

        });
    </script>
{/block}