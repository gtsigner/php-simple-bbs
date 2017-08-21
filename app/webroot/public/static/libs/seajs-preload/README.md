seajs-preload
=========

A Sea.js plugin for preload

Install
-------

Install with spm:

    $ spm install seajs/seajs-preload


Usage
-----

```html
<script src="path/to/sea.js"></script>
<script src="path/to/seajs-preload.js"></script>

<script>

seajs.config({
  preload: ['jquery']
})

seajs.use("path/to/mod")

</script>
```

Note
-----

This plugin bases on seajs ^2.3.0
