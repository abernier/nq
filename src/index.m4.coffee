create = (window) ->
  window           ?= require('jsdom').jsdom().createWindow()
  window.location  ?= require('location')
  window.navigator ?= require('navigator')

  if (window.XMLHttpRequest? and typeof window.ActiveXObject isnt 'function')
    window.XMLHttpRequest = require('xmlhttprequest').XMLHttpRequest

  `m4_undivert(jquery.js)`

  window.jQuery.noConflict()
  window.jQuery

module?.exports = @jQuery = create(@window)
module?.exports.create = create