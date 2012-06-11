create = (window, noConflict = false) ->
  window           ?= require('jsdom').jsdom().createWindow()
  window.location  ?= require('location')
  window.navigator ?= require('navigator')

  if (not window.XMLHttpRequest? and typeof window.ActiveXObject isnt 'function')
    window.XMLHttpRequest = require('xmlhttprequest').XMLHttpRequest

  `m4_undivert(jquery.js)`

  window.jQuery.noConflict() if noConflict
  window.jQuery

jQuery = @jQuery = create(@window)

module?.exports = jQuery
module?.exports.create = create