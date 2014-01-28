# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
ready = ->
  if $('body').attr('controller') == 'matches' && $('body').attr('action') == 'index'
    $.pjax.defaults.scrollTo = false
    window.wait = 0
    $(document).pjax('a', '#pjax-container', {push: false})
    $(document).on('pjax:success', ->
      setTimeout("$('.sidebar').sidebar('toggle')", wait)
      $('.sidebar').attr('toggled', '0')
    )
    $('table').click ->
      window.wait = $('.active.sidebar').size() * 300
      $('.active.sidebar').first().sidebar("toggle")

$(document).ready(ready)
$(document).on('page:load', ready)