// $(document).ready(function () {

//     // wire up button click
//     $('#go').click(function () {
//         // test for presence of geolocation
//         if (navigator && navigator.geolocation) {
//             // make the request for the user's position
//             navigator.geolocation.getCurrentPosition(geo_success, geo_error);
//         } else {
//             // use MaxMind IP to location API fallback
//             printAddress(geoip_latitude(), geoip_longitude(), true);
//         }
//     });


// function geo_success(position) {
//     printAddress(position.coords.latitude, position.coords.longitude);
// }

// function geo_error(err) {
//     // instead of displaying an error, fall back to MaxMind IP to location library
//     printAddress(geoip_latitude(), geoip_longitude(), true);
// }

// // use Google Maps API to reverse geocode our location
// function printAddress(latitude, longitude, isMaxMind) {
//     // set up the Geocoder object
//     var geocoder = new google.maps.Geocoder();

//     // turn coordinates into an object
//     var yourLocation = new google.maps.LatLng(latitude, longitude);


//     // find out info about our location
//     geocoder.geocode({ 'latLng': yourLocation }, function (results, status) {
//         if (status == google.maps.GeocoderStatus.OK) {
//             if (results[0]) {
//                 $('body').append('<p>Your Address:<br />' +
//                     results[0].formatted_address + '</p>');
//             } else {
//                 error('Google did not return any results.');
//             }
//         } else {
//             error("Reverse Geocoding failed due to: " + status);
//         }
//     });

//     // if we used MaxMind for location, add attribution link
//     if (isMaxMind) {
//         $('body').append('<p><a href="http://www.maxmind.com" target="_blank">IP
//             to Location Service Provided by MaxMind</a></p>');
//     }
// }

// function error(msg) {
//     alert(msg);
// }