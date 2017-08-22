/**
 * Created by zhaojunlike on 8/22/2017.
 */
define(function (require, exports, module) {

    /**
     * 截图粘贴
     * @param selector
     * @param callback
     */
    exports.paste = function (selector, callback) {
        document.querySelector(selector).addEventListener("paste", function (ev) {
            var data = ev.clipboardData;
            var items = (event.clipboardData || event.originalEvent.clipboardData).items;
            for (var i in items) {
                var item = items[i];
                //如果是图片
                if (item.kind === 'file' && item.type.indexOf('image') > -1) {
                    var blob = item.getAsFile();
                    var reader = new FileReader();
                    //reader读取完成后，xhr上传
                    reader.onload = function (event) {
                        var base64 = event.target.result;
                        //ajax上传图片
                        //返回一个base64数据
                        var img = {type: item.type, kind: item.kind};
                        if (typeof callback === "function") {
                            callback(event.target.result, img, event);
                        }

                    }; // data url!
                    reader.readAsDataURL(blob);//reader
                }
            }
        });
    };

    /**
     * 拖拽上传
     * @param selector
     * @param callback
     */
    exports.drag = function (selector, callback) {
        var element = document.querySelector(selector);
        element.addEventListener("drop", function (e) {
            e.preventDefault();
            var files = e.dataTransfer.files;
            for (var i = 0; i < files.length; i++) {
                //回调文件
                //alert("Drop " + file[i].name.toString());
                var reader = new FileReader();
                var item = files[i];
                reader.onload = function (event) {
                    var base64 = event.target.result;
                    //返回一个base64数据
                    var img = {type: item.type, name: item.name};
                    if (typeof callback === "function") {
                        callback(event.target.result, img, event);
                    }
                };
                reader.readAsDataURL(files[i]);//reader
            }
            return false;
        });

        element.addEventListener("dragenter", function (e) {
            e.stopPropagation();
            e.preventDefault();
        });

        element.addEventListener("dragover", function (e) {
            e.dataTransfer.dropEffect = "copy";
            e.stopPropagation();
            e.preventDefault();
        });

        document.body.addEventListener("dragover", function (e) {
            e.stopPropagation();
            e.preventDefault();
            return false;
        });
    }

    /**
     * 解析粘贴过来的内容，看是否有不是本站的图片,解析出来上传到本站
     */
    exports.parseImg = function () {

    }
});