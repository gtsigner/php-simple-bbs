/**
 * Created by zhaojunlike on 7/27/2017.
 */
var think_config = {
    static_source: '/static/',
    theme: '/theme'
};
var UEDITOR_HOME_URL = think_config.static_source + "vendor/ueditor/";
seajs.config({
    //设置路径
    paths: {
        'libs': think_config.static_source + 'libs',
        'theme': think_config.theme,
        'vendor': think_config.static_source + 'vendor',
    },
    // 设置别名，方便调用
    alias: {
        'jquery': 'libs/jquery/dist/jquery.min',
        'ajaxForm': 'libs/jquery-form/dist/jquery.form.min',

        'distPicker': 'libs/distpicker/dist/distpicker.min',

        'editormd': "libs/editor.md/editormd.min",

        'layer': 'libs/layer/build/layer.js',
        'layerCss': 'libs/layer/build/skin/default/layer.css',

        'bootstrap': 'libs/bootstrap/dist/js/bootstrap.min',
        'vue': 'libs/vue/dist/vue.min',

        'vuePager': 'libs/vuejs-paginate/dist/index.js',

        'vueDistPicker': 'libs/v-distpicker/dist/v-distpicker.js',
        'alertifyjs': 'libs/alertifyjs/dist/js/alertify.js',

        'alertifyCss': 'libs/alertifyjs/dist/css/alertify.css',
        'ajaxUploader': 'libs/AjaxUploader/SimpleAjaxUploader.min',


        'uMEditor': 'vendor/ueditor/ueditor.all.min.js',
        'uMEditorConfig': 'vendor/ueditor/ueditor.config.js',

        'ckeditor': 'vendor/ckeditor/ckeditor.js',
        'editor': 'libs/trumbowyg/dist/trumbowyg.min.js',
        'editorCss': 'libs/trumbowyg/dist/ui/trumbowyg.min.css',

        //css
        'portalPageCss': 'theme/admin/v1/css/login-page-css.css',


        //module
        'verifyCode': 'theme/admin/v1/js/verify-code.js',
    },
    //预加载
    preload: ['jquery', 'layerCss']
});

