//variable map and function start.
var map;
start();



// when document ready, render the restaurant info.
$(function() {
  var restaurant_name = $('<div>').attr( "id", "restName")
  var restaurant_address = $('<div>').attr( "id", "restAddress")
  var restaurant_email = $('<div>').attr( "id", "restEmail")
  var restaurant_phone = $('<div>').attr( "id", "restPhone")

  $('#nameRest').append(restaurant_name);
  $('#nameRest').append(restaurant_address);
  $('#nameRest').append(restaurant_email);
  $('#nameRest').append(restaurant_phone);
});



// validates if there is geolocation aviable in your browser
function start(){
  if ("geolocation" in navigator){
    navigator.geolocation.getCurrentPosition(onLocation, onError);
  }
}



// take the position from the geolocator and passes it to the map creation
function onLocation(position){
  var myPosition = {
    lat: position.coords.latitude,
    lng: position.coords.longitude

  };
  createMap(myPosition);
}
function onError(err){
  console.log("No geolocation aviable!!", err);
}



// creating a map from Google on a previously defined html div.
function createMap(position){
  map = new google.maps.Map($('#map')[0], {
    mapTypeControl: false,
    streetViewControl: false,
    center: position,
    zoom: 16
  });
  createMarker(position);
  fetchRestaurants();
}




// function to create the user position with a Google marker
function createMarker(position) {
  var marker = new google.maps.Marker({
    position: position,
    map: map
  })
};



// function that looks for all the restaurants rendered from the controller to a JSON
function fetchRestaurants(){
  $.ajax({
    type: 'GET',
    url: "/restaurants.json",
    success: function(response){
      response.forEach(function(item){
        var address = item.address;
        var city = item.city;
        var country = item.country;
        var path = "http://maps.google.com/maps/api/geocode/json?address=" + address + "+" + city + "+" + country;
        placeRestaurants(path, item.id);
      })
    },
    error: function (err) {
      console.log(err);
    }
  });
};


// function that takes the info from the JSON and the google path, to search the latitude and longitude
function placeRestaurants(path, id){
  $.ajax({
    type: 'GET',
    url: path,
    success: function(response) {
      var lng = response.results[0].geometry.location.lng;
      var lat = response.results[0].geometry.location.lat;
      var position = { lat,lng };
      createRestaurant(position, id);
    },
    error: function (err) {
      console.log(err);
    }
  });
}





// function that creates the marker of a restaurant, and renders the information of the restaurant in the info box (maybe the ugliest function i've done in the whole bootcamp)
function createRestaurant(position, id) {
  var icon = {
    url: "/rest-icon.png",
    scaledSize: new google.maps.Size(40, 40),
    origin: new google.maps.Point(0,0),
    anchor: new google.maps.Point(0, 0)
  };
  var marker = new google.maps.Marker({
    position: position,
    map: map,
    icon: icon,
  })
  marker.addListener('click', function() {
    map.setZoom(16);
    map.setCenter(marker.getPosition());

     $.ajax({
       type: 'GET',
       url: "/restaurants/"+ id +".json",
       success: function(item){
        $('#menuMeals').empty()
        var actualSeason = currentSeason();
        if (item.menus.length == 0){
          $('#menu').html(" ");
          $('#menuPrice').html(" ");
        } else {
          item.menus.forEach(function(menu){
            if (menu.season === actualSeason[0]){
              $('#menu').append('#nameMenu').html("Today's menu:  " + menu.name);
              $('#menuPrice').append('#nameMenu').html("Price: " + menu.price + "€");
              var i = 0;

              menu.meals.forEach(function(meal){
                $('#menuMeals').append("<li>" + meal.name + "</li>");
              });
            } else {
              $('#menu').html("No menus for the current season");
            }
          })
        }
        $('#restName').html("Name: " + item.name);
        $('#restAddress').html("Address: " + item.address +", "+ item.city);
        $('#restEmail').html("Email: " + item.email);
        $('#restPhone').html("Phone: " + item.phone);
       },
       error: function (err) {
         console.log(err);
       }
   });
 });
};


function currentSeason(){
  var year = new Date().getFullYear();
  var springStart = new Date(year,02,21);
  var summerStart = new Date(year,06,21);
  var autumnStart = new Date(year,08,22);
  var winterStart = new Date(year,11,21);
  var seasons = {
    "Summer": [summerStart, autumnStart],
    "Autumn": [autumnStart, winterStart],
    "Winter": [winterStart, springStart],
    "Spring": [springStart, summerStart]
  }
  var actualSeason = Object.keys(seasons).filter(function(key){
    return (new Date() > seasons[key][0] && new Date() < seasons[key][1])
  })
  return actualSeason;
}
