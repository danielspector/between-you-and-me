# Between You & Me 

![Whiteboard](http://i.imgur.com/n78p1GS.jpg)

## MVP ##

* Given two addresses, return a place to meet in between them (either using walking, or how the crow flies) 


## Other features ##

* Using transit to find a midpoint
* Types of places (coffee shops, restaurants, bars--use Yelp categories)
** Foursquare checkins: least likely to be crowded at a certain time
** Places that are open at a certain time
* Finding the most convenient place for multiple people
* Login
** Share addresses with friends
** Safe neighborhoods only
** Whitelisted neighborhoods


## Technologies ##

* Google Maps API
* OpenStreetMap
* Leaflets (on Google Maps)
* Yelp API
* Javascript
* Rails
* Oauth
* Postgres

## To-Do ##

Feature List - Needs to be implemented
 
* Yelp result, sort by highest rating rather than first
* Actually use the interactive google maps
* Use the Chosen jQuery plugin from Harvest for the Yelp categories
  a. http://www.yelp.com/developers/documentation/category_list
* Top three results or ability to pass and get the new one
* Open at a specific time, when they want to go
* Train directions from both addresses to the yelp midpoint
* Option to switch between transit, driving and walking directions
* Find the midpoint based on travel time rather than distance
* Omniauth user authentication - Facebook and get friends addresses (Google)
* Getting/storing addresses that you've been previously searched for.
10. Front - End. Presentation is so key.
