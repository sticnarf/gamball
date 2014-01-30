# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
ready = ->
  $('.ui.dropdown').dropdown();

  if $('body').attr('controller') == 'users' && $('body').attr('action') == 'hall'
    load_matches()
    $('.league.item').click ->
      $(this).toggleClass("active")
      load_matches()
    $('iframe').load ->
      $('.loading.icon').hide()
      $('iframe').show()


load_matches = ->
  $('iframe').hide()
  $('.loading.icon').show()
  match_url = "/matches?"
  for i in $('.league.item.active')
    match_url += "leagues["
    match_url += $(i).attr("league_id")
    match_url += "]=&"
  match_url = match_url.slice(0, -1)
  $('iframe').attr("src", match_url)

$(document).ready(ready)
$(document).on('page:load', ready)