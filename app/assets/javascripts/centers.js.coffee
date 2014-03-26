# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
addressForTwilio = ->
  routed_gmaps = "<div style=display:none'><input name='sent_gmaps' type='hidden' value='" + yelp_address + "'/></div>"
  $("div#number_form input").prepend(routed_gmaps)

showAccordion = (id) ->
  $('.yelp-result').removeClass('active-yelp')
  $('.yelp-result').addClass('inactive-yelp')
  $('#' + id).removeClass('inactive-yelp')
  $('#' + id).addClass('active-yelp')
  $('#' + id).addClass('only-active-yelp')
  $('#' + id).css('background-color', '#B3D1FF')
  $('#' + id).css('height', '30%')
  $('#directions-panel').fadeIn()

hideAccordion = (id) ->
  $('#directions-panel').fadeOut("slow", ->
    $('.yelp-result').removeClass('inactive-yelp')
    $('#' + id).css('height', '33%')
    $('.yelp-result').addClass('active-yelp')
    $('#' + id).removeClass('only-active-yelp')
    $('#' + id).css('background-color', 'white')
  )

$(document).ready ->

  $('.yelp-result').click ->
    yelp_address = $(this).find('.yelp-point').text()

    calcRoute(yelp_address)
    addressForTwilio()

    # accordion logic
    $yelpClass = $(this).attr('class')
    if ($yelpClass.match(/only-active-yelp/) == null)
      showAccordion( $(this).attr('id') )
    else if ($yelpClass.match(/active-yelp/)[0] == 'active-yelp' && \
             $yelpClass.match(/only-active-yelp/)[0] == 'only-active-yelp')
      hideAccordion( $(this).attr('id') )
    # end accordion logic
