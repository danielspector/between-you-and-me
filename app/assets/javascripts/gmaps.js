
  var map;
  var directionsDisplay;
  globalVariable = {}
  hashForLatLong = {}
  google.maps.event.addDomListener(window, 'load', initialize);
  // google.maps.event.addDomListener(window, 'load', calcRoute);

  function initialize() {
    directionsDisplay = new google.maps.DirectionsRenderer();

    var mapOptions = {
      zoom: 7,
      center: new google.maps.LatLng(40.757395, -73.989977)
    };



    map = new google.maps.Map(document.getElementById('map-canvas'), mapOptions);
    directionsDisplay.setMap(map);
    directionsDisplay.setPanel(document.getElementById('directions-panel'));

    $('.yelp-latlong').each(function(){
      var lat = $(this).text().split(', ')[0];
      var lon = $(this).text().split(', ')[1];
      var thisLatLong = new google.maps.LatLng(lat, lon);
      var marker = new google.maps.Marker({
        position: thisLatLong,
        map: map,
      });
    });


    // var myLatlng = new google.maps.LatLng(40.2, -73.989977);
    // var marker = new google.maps.Marker({
    //   position: myLatlng,
    //   map: map,
    //   title:"Hello World!"
    // });

 

    var control = document.getElementById('control');
    control.style.display = 'block';
    map.controls[google.maps.ControlPosition.TOP_CENTER].push(control);
    console.log('done with initialize');
  }

  function calcRoute(yelp_address) {
    console.log("line 41: calRoute")
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

    if (globalVariable[yelp_address]) {
      directionsDisplay.setDirections(globalVariable[yelp_address]);
      return
    }

    directionsService.route(request, function(response, status) {
      console.log(status);
      globalVariable[yelp_address] = response;

      if (status == google.maps.DirectionsStatus.OK) {
        console.log("CHECKING STATUS, line 82")
        directionsDisplay.setDirections(response);
      }
    });

    console.log("line 87 done");
  }
