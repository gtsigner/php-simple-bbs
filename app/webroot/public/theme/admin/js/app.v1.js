requirejs.config({
    baseUrl: '/static',
    paths: {
        jquery: 'jquery/dist/jquery.min',
        bootstrap: 'bootstrap/dist/js/bootstrap.min',
    },
    map: {
        '*': {
            'css': 'require-css/css' // or whatever the path to require-css is
        }
    },
    shim: {
        bootstrap: {
            deps: ['jquery', 'css!bootstrap/dist/css/bootstrap.min.css']
        }
    }
});
requirejs(['jquery', 'bootstrap'], function ($, bootstrap) {
    console.log($);
});