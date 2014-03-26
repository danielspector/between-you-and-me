function initialize() {
  directionsDisplay = new google.maps.DirectionsRenderer();

  var mapOptions = {
    zoom: 12,
    center: new google.maps.LatLng(40.757395, -73.989977)
  };

  map = new google.maps.Map(document.getElementById('map-canvas'), mapOptions);

  directionsDisplay.setMap(map);
  directionsDisplay.setPanel(document.getElementById('directions-panel'));

  $('.yelp-latlong').each(function(){
    var lat = $(this).text().split(', ')[0];
    var lon = $(this).text().split(', ')[1];
    var thisLatLong = new google.maps.LatLng(lat, lon);
    hashForLatLon[$('this').text()] = thisLatLong;
    var marker = new google.maps.Marker({
      position: thisLatLong,
      map: map
    });
  });

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

  map.setCenter(new google.maps.LatLng(40.757395, -73.989977));

  var control = document.getElementById('control');
  control.style.display = 'block';
  map.controls[google.maps.ControlPosition.TOP_CENTER].push(control);
}

function calcRoute(yelp_address) {
  if ( typeof(yelp_address) == "object" ) {
    yelp_address = $('.yelp-point').eq(0).text();
  }
  var start = $('#start-point').val();

  console.log('start is: ' + start);
  console.log('end is: ' + yelp_address);

  var directionsService = new google.maps.DirectionsService();

  if ( yelp_routes[yelp_address] ) {
    directionsDisplay.setDirections( yelp_routes[yelp_address] );
    return
  }

  var request = {
    origin: start,
    destination: yelp_address,
    travelMode: google.maps.TravelMode.TRANSIT
  };

  directionsService.route(request, function(response, status) {
    console.log("Status of google direction service is: " + status);
    yelp_routes[yelp_address] = response;

    if (status == google.maps.DirectionsStatus.OK) {
      directionsDisplay.setDirections(response);
    }
  });
}

$(document).ready(function() {
  var map;
  var directionsDisplay;
  yelp_routes = {}
  hashForLatLon = {}
  google.maps.event.addDomListener(window, 'load', initialize);
})
