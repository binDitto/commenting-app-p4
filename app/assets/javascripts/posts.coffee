# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$(document).on 'click', '.above-toggle', (e) ->
  e.preventDefault()
  $('.above').fadeIn(2000)
  e.stopPropagation()

$(document).on 'click', '.thefa', (e) ->
  e.preventDefault()
  $('.above').fadeOut(1000)
  e.stopPropagation()
