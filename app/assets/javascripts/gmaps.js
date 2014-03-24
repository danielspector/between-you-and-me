var directionsDisplay;
var directionsService = new google.maps.DirectionsService();


function initialize() {
  directionsDisplay = new google.maps.DirectionsRenderer();
  var mapOptions = {
    zoom: 12,
    center: new google.maps.LatLng(40.757395, -73.989977)
  };

  var map = new google.maps.Map(document.getElementById('map-canvas'),
      mapOptions);
  directionsDisplay.setMap(map);
  directionsDisplay.setPanel(document.getElementById('directions-panel'));

  var myLatlng = new google.maps.LatLng(40.776272,-73.976013);
  var test = document.getElementById('yelp_1').value;
  var marker = new google.maps.Marker({
    position: myLatlng,
    map: map,
    // title:"Hello World!"
  });
  var marker = new google.maps.Marker({
    position: test,
    map: map,
    // title:"Hello World!"
  });

  var control = document.getElementById('control');
  control.style.display = 'block';
  map.controls[google.maps.ControlPosition.TOP_CENTER].push(control);
}

function calcRoute() {
  var start = document.getElementById('start-point').value;
  var end = document.getElementById('yelp-point').value;
  var request = {
    origin: start,
    destination: end,
    travelMode: google.maps.TravelMode.TRANSIT
  };
  directionsService.route(request, function(response, status) {
    if (status == google.maps.DirectionsStatus.OK) {
      directionsDisplay.setDirections(response);
    }
  });
}

google.maps.event.addDomListener(window, 'load', initialize);
google.maps.event.addDomListener(window, 'load', calcRoute);
