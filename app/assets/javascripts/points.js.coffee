
$(document).ready ->

  sendRequestForYelpData = (lat, long) ->
    $.ajax({
      url: '/points/yelp'
      type: 'POST'
      dataType: 'json'
      data: {
        center: {
          latitude: lat
          longitude: long
        }
        search: {
          term: $("input[name='search[term]']").val()
        }
      }
      error: ->
        alert('Something went wrong with Yelp')
      success: (data) ->
        console.log data
        $("<img src='http://maps.google.com/maps/api/staticmap?size=450x300&sensor=false&zoom=12&markers=" +
        data.lat.toString() + "%2C" + data.long.toString() + "'/>").insertAfter('#point_form')
        $("<p>" + data.location + "</p>").insertAfter('#point_form')
        $("<p>Categories: " + data.categories + "</p>").insertAfter("#point_form")
        $("<p>" + data.review_count.toString() + " reviews</p>").insertAfter("#point_form")
        $("<img src='" + data.rating_img + "' />").insertAfter('#point_form')
        $("<h2><a target='_blank' href='" + data.the_url + "'>" + data.name + "</a></h2>").insertAfter('#point_form')
        $("<img src='" + data.venue_image + "' />").insertAfter('#point_form')
        $(data.open_or_closed).insertAfter("#point_form")

    })

  $('#point_form').submit ->
    $.ajax({
      url: '/points'
      type: 'POST'
      dataType: 'json'
      data: {
        point: {
          address1: $("input[name='point[address1]']").val()
          address2: $("input[name='point[address2]']").val()
        }
      }
      error: ->
        alert 'Something went wrong... Did you fill in both addresses?'
      success: (data) ->
        # check if the data contains nil values, then throw an error message. else continue printing the map
        $("<img src='http://maps.google.com/maps/api/staticmap?size=450x300&sensor=false&zoom=12&markers=" +
        data.center.latitude.toString() + "%2C" + data.center.longitude.toString() + "&markers=" +
        data.address1.latitude.toString() + "%2C" + data.address1.longitude.toString() + "&markers=" +
        data.address2.latitude.toString() + "%2C" + data.address2.longitude.toString() + "'/>").insertAfter('#point_form')
        $('<p>' + data.center.address + '</p>').insertAfter('#point_form')
        sendRequestForYelpData(data.center.latitude, data.center.longitude)
    })
