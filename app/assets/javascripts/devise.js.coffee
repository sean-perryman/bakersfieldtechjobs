# JavaScriptings that have to do with the Device views (so far, anyway)

do_on_load = ->
  $(".controls input").on "focus", ->
    $(this).next("p").show()
    return

  $(".controls input").on "blur", ->
    $(this).next("p").hide()
    return

  return

$(document).ready do_on_load
$(window).bind "page:change", do_on_load