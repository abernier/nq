jQuery = (window) ->
  ###
  ../lib/jquery/
  ###

  window.jQuery.noConflict()
  window.jQuery

create = (window) ->
  window ?= do ->
    zombie  = require 'zombie'
    browser = new zombie.Browser()
    browser.window

  jQuery(window)

jQuery = @jQuery = create(@window)
module?.exports = jQuery
module?.exports.create = create