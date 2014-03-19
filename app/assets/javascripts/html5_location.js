// var x = document.getElementById("find_me");
// function getLocation()
//   {
//   if (navigator.geolocation)
//     {
//     navigator.geolocation.getCurrentPosition(showPosition);
//     }
//   else{x.innerHTML="Geolocation is not supported by this browser.";}
//   }
// function showPosition(position)
//   {
//   x.innerHTML="Latitude: " + position.coords.latitude + 
//   "<br>Longitude: " + position.coords.longitude;  
//   }


  
//   jQuery(window).ready(function(){
//             jQuery("#btnInit").click(initiate_geolocation);
//         });
 
//         function initiate_geolocation() {
//             navigator.geolocation.getCurrentPosition(handle_geolocation_query);
//         }
 
//         function handle_geolocation_query(position){
//             alert('Lat: ' + position.coords.latitude + ' ' +
//                   'Lon: ' + position.coords.longitude);
//         }

// $(function(){
//   $('#find_me').on('click', function()
//     {
//         $('#location_address1').val($(this).html());
//     });
// });


$(document).ready(function() {
      
      var startingLocation;
      $('find_me').click(function (e) {
        // e.preventDefault();       
        e.console.log("Here I am!")
        // check if browser supports geolocation
        if (navigator.geolocation) { 
          // get user's current position
          navigator.geolocation.getCurrentPosition(function (position) {   
            // get latitude and longitude
            var latitude = position.coords.latitude;
            var longitude = position.coords.longitude;
            startingLocation = latitude + "," + longitude;
            
           $('#location_address1').val($(startingLocation).html());
            
          });
        }
        
        // fallback for browsers without geolocation
        else {
          
          // get manually entered postcode
          // startingLocation = $('.manual-location').val();
          
          // if user has entered a starting location, send starting location and destination to goToGoogleMaps function
          if (startingLocation != '') {
            goToGoogleMaps(startingLocation, destination);
          }
          // else fade in the manual postcode field
          else {
            $('.no-geolocation').fadeIn();
          }
          
        }
              
          
      });
      
    });