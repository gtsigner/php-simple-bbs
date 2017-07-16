{extend name="base/common"}
{block name="body"}
    <div class="container-fluid" id="config-app">
        <div class="row data-list-header-action">
            <button type="button" class="btn btn-success" data-toggle="modal" data-target="#addModal">新增
            </button>
        </div>
        <div class="row">
            <!--增加modal-->
            <div class="modal fade" id="addModal" tabindex="-1" role="dialog"
                 aria-labelledby="myLargeModalLabel">
                <div class="modal-dialog modal-lg" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                                        aria-hidden="true">&times;</span></button>
                            <h4 class="modal-title" v-html="tmp_model.modal_title"></h4>
                        </div>
                        <div class="modal-body">
                            <form>
                                <div class="form-group">
                                    <button type="button" class="btn btn-lg btn-primary btn-block" id="uploadBtn">
                                        选择上传文件
                                    </button>
                                </div>
                            </form>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                        </div>
                    </div>
                </div>
            </div>

            <div class="modal fade" id="addEditModal" tabindex="-1" role="dialog"
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
                                <div class="form-group">
                                    <label for="" class="control-label">排序</label>
                                    <input class="form-control" type="text" name="sort" v-model="tmp_model.sort">
                                </div>
                                <div class="form-group">
                                    <label for="" class="control-label">文件名</label>
                                    <input class="form-control" type="text" name="title" v-model="tmp_model.title">
                                </div>
                                <div class="form-group">
                                    <label for="" class="control-label">描述</label>
                                    <textarea class="form-control" v-model="tmp_model.desc"></textarea>
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
                    <th>ID</th>
                    <th>排序</th>
                    <th>文件名</th>
                    <th>描述</th>
                    <th>创建日期</th>
                    <th>MD5值</th>
                    <th>下载量</th>
                    <th>状态</th>
                    <th style="width: 10%">操作</th>
                </tr>
                </thead>
                <tbody>
                <tr v-for="vo in data_list">
                    <td><span v-html="vo.id"></span></td>
                    <td><span v-html="vo.sort"></span></td>
                    <td><span v-html="vo.title"></span></td>
                    <td><span v-html="vo.desc"></span></td>
                    <td><span v-html="vo.create_time"></span></td>
                    <td><span v-html="vo.md5"></span></td>
                    <td><span v-html="vo.download_count"></span></td>
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
        require(['vue', 'layer', 'vuePager', 'ajaxUploader'], function (Vue, layer, vuePager, AjaxUploader) {
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
                        $.post("{:url('bbs.file/getList')}",{page:pageNum}, function (ret) {
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
                    edit: function (vo) {
                        //写入模型
                        this.tmp_model = vo;
                        this.tmp_model.modal_title = "编辑";
                        this.tmp_model.method = "edit";
                        $('#addEditModal').modal('toggle');
                    },
                    del: function (id) {
                        var self = this;
                        layer.confirm("确认删除么(不可恢复)",{}, function () {
                            $.post("{:url('bbs.file/delete')}",{id:id}, function (ret) {
                                layer.msg(ret.msg);
                                self.loadData();
                            });
                        }, function () {
                            layer.msg("用户删除取消");
                        })
                    },
                    changeStatus: function (vo) {
                        var self = this;
                        $.post("{:url('bbs.file/changeStatus')}",{id:vo.id}, function (ret) {
                            if (ret.code === 1) {
                                vo.status = vo.status === 1 ? 0 : 1;
                            }
                        });
                    },
                    sureAddEdit: function () {
                        var self = this;
                        $.post("{:url('bbs.file/addEdit')}", self.tmp_model, function (ret) {
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

            //Ajax
            var uploader = new AjaxUploader.SimpleUpload({
                button: 'uploadBtn', // file upload button
                url: '{:url('api/uploader/upload')}', // server side handler
                name: 'up_file', // upload parameter name
                progressUrl: 'uploadProgress.php', // enables cross-browser progress support (more info below)
                responseType: 'json',
                multiple: false,
                //allowedExtensions: ['jpg', 'jpeg', 'png', 'gif', 'gzip', 'zip', '7z', 'tar.gz','mp4'],
                maxSize: 50240, // kilobytes
                hoverClass: 'ui-state-hover',
                focusClass: 'ui-state-focus',
                disabledClass: 'btn-disabled btn-danger',
                onSubmit: function (filename, extension) {
                    $("#uploadBtn").html("上传中,请稍后...........");
                },
                onComplete: function (filename, response) {
                    $("#uploadBtn").html("请选择上传文件");
                    layer.msg(response.msg);
                    // do something with response...
                    app.loadData();
                }
            });
        });


    </script>
{/block}