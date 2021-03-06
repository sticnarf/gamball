# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
ready = ->
  if $('body').attr('controller') == 'static' && $('body').attr('action') == 'index'
    $.pjax.defaults.scrollTo = false
    $(document).pjax('a', '#pjax-container', {push: false})
    $('a').click ->
      $("#pjax-container").slideUp()
    $("#pjax-container").hide();
    $(document).on('pjax:success', ->
      $("#pjax-container").slideDown(200, ->
        $('html, body').animate({ scrollTop: $(document).height() })
      )
      $('form').submit((event) ->
        $.pjax.submit(event, '#pjax-container', {push: false})
      )
      for i in $('input')
        if $(i).parent().hasClass('field_with_errors')
          $(i).unwrap()
          $(i).parent().parent().addClass("error")
    )

$(document).ready(ready)
$(document).on('page:load', ready)