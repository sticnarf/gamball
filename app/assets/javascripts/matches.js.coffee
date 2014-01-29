# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
ready = ->
  if $('body').attr('controller') == 'matches' && $('body').attr('action') == 'index'
    $.pjax.defaults.scrollTo = false
    window.wait = 0
    $(document).pjax('a', '#pjax-container', {push: false, timeout: 20000})
    $(document).on('pjax:send', ->
      setTimeout("$('.sidebar').sidebar('toggle')", window.wait)
    )
    $(document).on('pjax:success', ->
      $('form').submit((event) ->
        $.pjax.submit(event, '#pjax-container', {push: false})
        window.wait = $('.active.sidebar').size() * 200
        $('.sidebar').first().sidebar("toggle")
      )
      $('#table').css("padding-bottom", $('.sidebar').css('height'))
      $.ajax({type: "GET", url: "/money"}).done( (msg) ->
        $(parent.document).find('#money').text(msg)
      )
      $('#bet_money').keyup ->
        $('#confirm').val(parseFloat($('#bet_money').val()))
    )
    $('#table').mouseup ->
      window.wait = $('.active.sidebar').size() * 400
      $('.active.sidebar').first().sidebar("toggle")

$(document).ready(ready)
$(document).on('page:load', ready)