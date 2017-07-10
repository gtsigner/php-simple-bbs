{extend name="base/common"}
{block name="body"}
    <div class="container-fluid" id="index-app">
        <div class="row data-list-header-action">
            <button type="button" class="btn btn-success" data-toggle="modal" data-target="#addCategoryModal">新增栏目
            </button>
        </div>
        <div class="row">
            <!--增加modal-->
            <div class="modal fade" id="addCategoryModal" tabindex="-1" role="dialog"
                 aria-labelledby="myLargeModalLabel">
                <div class="modal-dialog modal-lg" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                                        aria-hidden="true">&times;</span></button>
                            <h4 class="modal-title">增加栏目</h4>
                        </div>
                        <div class="modal-body">
                            <form action="{:url('bbs.category/addCategory')}" method="post">
                                <div class="form-group">
                                    <label for="" class="control-label">栏目标题</label>
                                    <input type="text" name="title" class="form-control" v-model="tmp_category.title">
                                </div>
                                <div class="form-group">
                                    <label for="" class="control-label">排序(小号在前)</label>
                                    <input type="number" name="sort" class="form-control" v-model="tmp_category.number">
                                </div>

                                <div class="form-group">
                                    <label for="" class="control-label">备注</label>
                                    <textarea name="mark" class="form-control" v-model="tmp_category.mark"></textarea>
                                </div>
                            </form>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                            <button type="button" class="btn btn-primary" v-on:click="addCategory">确认新增</button>
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
                        <button type="button" class="btn btn-sm btn-primary">编辑</button>
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
                    tmp_category: {
                        title: '', number: 0, mark: ''
                    }
                },
                methods: {
                    getDataList: function () {
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
                            axios.post("{:url('bbs.category/delete')}",{id:id}).then(function (response) {
                                console.log(response);
                                layer.msg(response.data.msg);
                                self.getDataList();
                            }).then(function (error) {

                            });
                        }, function () {
                            layer.msg("用户删除取消");
                        })
                    },
                    addCategory: function () {
                        var self = this;
                        $.post("{:url('bbs.category/addCategory')}", self.tmp_category, function (ret) {
                            self.getDataList();
                            $('#addCategoryModal').modal('toggle');
                            layer.msg(ret.msg);
                        });
                    }
                },
                mounted: function () {
                    this.getDataList();
                }
            })

        });
    </script>
{/block}