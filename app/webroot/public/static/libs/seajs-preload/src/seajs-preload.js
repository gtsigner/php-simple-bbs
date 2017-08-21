var data = seajs.data
var doc = document

seajs.Module.preload = function(callback) {
  var preloadMods = data.preload
  var len = preloadMods.length

  if(len) {
    seajs.Module.use(preloadMods, function() {
      // Remove the loaded preload modules
      preloadMods.splice(0, len)

      // Allow preload modules to add new preload modules
      seajs.Module.preload(callback)
    }, data.cwd + "_preload_" + data.cid())
  }
  else {
    callback()
  }
}

seajs.use = function(ids, callback) {
  seajs.Module.preload(function() {
    seajs.Module.use(ids, callback, data.cwd + "_use_" + data.cid())
  })
  return seajs
}

data.preload = (function() {
  var plugins = []

  // Convert `seajs-xxx` to `seajs-xxx=1`
  // NOTE: use `seajs-xxx=1` flag in uri or cookie to preload `seajs-xxx`
  var str = location.search.replace(/(seajs-\w+)(&|$)/g, "$1=1$2")

  // Add cookie string
  str += " " + doc.cookie

  // Exclude seajs-xxx=0
  str.replace(/(seajs-\w+)=1/g, function(m, name) {
    plugins.push(name)
  })

  return plugins
})()