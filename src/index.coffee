jQuery = (window) ->
    ###
    # jQuery
    #
    (function( window, undefined ) {
    ...
    // Expose jQuery to the global object
    window.jQuery = window.$ = jQuery;
    })(window);
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