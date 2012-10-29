create = (window, noConflict = false) ->
  unless window?
    window = require('jsdom').jsdom().createWindow()
    window.XMLHttpRequest = require('xmlhttprequest').XMLHttpRequest
    window.XMLHttpRequest.prototype.withCredentials = false
  window.location  ?= require('location')
  window.navigator ?= require('navigator')

  ###
  jQuery START
  ===========================
  ###

  `m4_undivert(jquery.js)`

  ###
  ===========================
  jQuery END
  ###

  window.jQuery.noConflict() if noConflict
  window.jQuery

jQuery = @jQuery = create(@window)

module?.exports = jQuery
module?.exports.create = create