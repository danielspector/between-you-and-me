
$(document).ready ->

  $('#location_form').submit ->
    $.ajax({
      url: '/locations'
      type: 'POST'
      dataType: 'json'
      data: {
        location: {
          address1: $("input[name='location[address1]']").val()
          address2: $("input[name='location[address2]']").val()
        }
      }
      error: ->
        console.log $("input[name='location[address1]']")
      success: (data) ->
        $("<img src='http://maps.google.com/maps/api/staticmap?size=450x300&sensor=false&zoom=12&markers=" +
        data.center.latitude.toString() + "%2C" + data.center.longitude.toString() + "&markers=" +
        data.address1.latitude.toString() + "%2C" + data.address1.longitude.toString() + "&markers=" +
        data.address2.latitude.toString() + "%2C" + data.address2.longitude.toString() + "'/>").insertAfter('#location_form')
        $('<p>' + data.center.address + '</p>').insertAfter('#location_form')
    })
