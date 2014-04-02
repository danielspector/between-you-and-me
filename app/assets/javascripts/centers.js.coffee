# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
addressForTwilio = (yelp_address) ->
  routed_gmaps = "<div style=display:none'><input name='sent_gmaps' type='hidden' value='" + yelp_address + "'/></div>"
  $("div#number_form input").prepend(routed_gmaps)

showAccordion = (that) ->
  $('.yelp-result').removeClass('active-yelp').addClass('inactive-yelp')
  that.removeClass('inactive-yelp')
  that.addClass('active-yelp')
  that.addClass('only-active-yelp')
  that.css('height', '30%')
  $('#directions-panel').fadeIn()

hideAccordion = (that) ->
  $('#directions-panel').fadeOut("slow", ->
    $('.yelp-result').removeClass('inactive-yelp')
    $('.yelp-result').addClass('active-yelp')
    that.css({
      'height': '33%'
      'background-color': 'rgba(179,209,255,0.6)'
    })
    that.removeClass('only-active-yelp')
  )

yelpResultClick = (that) ->
  yelp_address = that.find('.yelp-point').text()

  # accordion logic
  $yelpClass = that.attr('class')
  if ($yelpClass.match(/only-active-yelp/) == null)
    calcRoute(yelp_address)
    showAccordion( that )
  else if ($yelpClass.match(/active-yelp/)[0]      == 'active-yelp' &&
           $yelpClass.match(/only-active-yelp/)[0] == 'only-active-yelp')
    hideAccordion( that )
  # end accordion logic

$(document).ready ->

  $('.yelp-result').on 'click', -> yelpResultClick( $(this) )
  # Commented this out because it was causing problems--uncomment later!!
  # addressForTwilio(yelp_address)
