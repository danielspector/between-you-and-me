
  var map;
  var directionsDisplay;
  yelp_routes = {}
  var hashForLatLon = {}
  google.maps.event.addDomListener(window, 'load', initialize);
  // google.maps.event.addDomListener(window, 'load', calcRoute);

  function initialize() {
    directionsDisplay = new google.maps.DirectionsRenderer();

    var mapOptions = {
      //we will update this later
      zoom: 12,
      center: new google.maps.LatLng(40.757395, -73.989977)
    };



    map = new google.maps.Map(document.getElementById('map-canvas'), mapOptions);
    directionsDisplay.setMap(map);
    directionsDisplay.setPanel(document.getElementById('directions-panel'));

    // @loc1

    //@loc2


    // Take the lat lon of the yelp points and put them in the hash
    // Also create markers for each.
    $('.yelp-latlong').each(function(){
      var lat = $(this).text().split(', ')[0];
      var lon = $(this).text().split(', ')[1];
      var thisLatLong = new google.maps.LatLng(lat, lon);
      hashForLatLon[$('this').text()] = thisLatLong;
      var marker = new google.maps.Marker({
        position: thisLatLong,
        map: map,
      });
    });

    // Get lat lon of the friends' locations and put them in the hash
    // Also create markers for each.
    $('.friend-latlong').each(function(){
      var lat = $(this).text().split(', ')[0];
      var lon = $(this).text().split(', ')[1];
      var thisLatLong = new google.maps.LatLng(lat, lon);
      hashForLatLon[$('this').text()] = thisLatLong;
      var marker = new google.maps.Marker({
        position: thisLatLong,
        map: map,
      });
    });

    // Update the zoom level based on the friends' and yelp locations
    map.setCenter(new google.maps.LatLng(40.757395, -73.989977));

    var control = document.getElementById('control');
    control.style.display = 'block';
    map.controls[google.maps.ControlPosition.TOP_CENTER].push(control);
    console.log('done with initialize');
  }

  function calcRoute(yelp_address) {
    console.log("line 41: calcRoute")
    // yelp_address = yelp_address || $('.yelp-point').eq(0).text();
    if ( typeof(yelp_address) == "object" ) {
      yelp_address = $('.yelp-point').eq(0).text();
    }
    var start = $('#start-point').val();

    console.log('start is: ' + start);
    console.log('end is: ' + yelp_address);

    var request = {
      origin: start,
      destination: yelp_address,
      travelMode: google.maps.TravelMode.TRANSIT
    };
    console.log("Line 56: after request object is created");

    var directionsService = new google.maps.DirectionsService();
    console.log("Line 69: after directionsService is created");

    if (yelp_routes[yelp_address]) {
      directionsDisplay.setDirections(yelp_routes[yelp_address]);
      return
    }

    directionsService.route(request, function(response, status) {
      console.log("Status of google direction service is: " + status);
      yelp_routes[yelp_address] = response;

      if (status == google.maps.DirectionsStatus.OK) {
        directionsDisplay.setDirections(response);
      }
    });

  }
