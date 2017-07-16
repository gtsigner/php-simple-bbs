{extend name="base/common"}
{block name="body"}
    <div class="container-fluid" id="index-app">
        <div class="row data-list-header-action">
            <button type="button" class="btn btn-success" data-toggle="modal" v-on:click="addShow">新增
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

            <table class="table-bordered table table-responsive table-hover">
                <thead>
                <tr>
                    <th>编号</th>
                    <th>排序</th>
                    <th>栏目名称</th>
                    <th>状态</th>
                    <th style="width: 10%">操作</th>
                </tr>
                </thead>
                <tbody>
                <tr v-for="vo in data_list">
                    <td><span v-html="vo.id"></span></td>
                    <td><span v-html="vo.sort"></span></td>
                    <td><span v-html="vo.title"></span></td>
                    <td><span v-html="vo.status"></span></td>
                    <td>
                        <button type="button" class="btn btn-sm btn-primary" v-on:click="edit(vo)">编辑</button>
                        <button type="button" class="btn btn-sm btn-danger" v-on:click="deleteCategory(vo.id)">删除
                        </button>
                    </td>
                </tr>
                </tbody>
            </table>
        </div>
    </div>
    <script>
        require(['vue', 'axios', 'layer'], function (Vue, axios, layer) {
            var app = new Vue({
                el: "#index-app",
                data: {
                    data_list: [],
                    tmp_model: {
                        modal_title: '新增',
                        modal_method: 'add',
                        title: '',
                        sort: 0,
                        mark: ''
                    }
                },
                methods: {
                    loadData: function () {
                        var self = this;
                        self.data_list = [];
                        axios.get("{:url('bbs.category/getCategory')}").then(function (response) {
                            response.data.data.forEach(function (item) {
                                self.data_list.push(item);
                            });
                        }).then(function (error) {

                        });
                    },
                    deleteCategory: function (id) {
                        var self = this;
                        layer.confirm("确认删除此栏目么(要求栏目下不可有帖子)",{}, function () {
                            $.post("{:url('bbs.category/delete')}",{id:id}, function (ret) {
                                layer.msg(ret.msg);
                                self.loadData();
                            });
                        }, function () {
                            layer.msg("用户删除取消");
                        })
                    },
                    addShow: function () {
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
                    addCategory: function () {
                        var self = this;
                        $.post("{:url('bbs.category/addCategory')}", self.tmp_category, function (ret) {
                            self.getDataList();
                            $('#addCategoryModal').modal('toggle');
                            layer.msg(ret.msg);
                        });
                    },
                    sureAddEdit: function () {
                        var self = this;
                        $.post("{:url('bbs.category/addEdit')}", self.tmp_model, function (ret) {
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