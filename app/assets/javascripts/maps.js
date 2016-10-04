// function myMap() {
//   var myCenter = new google.maps.LatLng(41.3977351, 2.1903);
//   var mapCanvas = document.getElementById("map");
//   var mapOptions = {
//     mapTypeControl: false,
//     streetViewControl: false,
//     center: myCenter,
//     zoom: 16
//   }
//   map = new google.maps.Map(mapCanvas, mapOptions);
//   var marker = new google.maps.Marker({position: myCenter});
//   marker.setMap(map);
//   setupAutocomplete();
// }

var map;

if ("geolocation" in navigator){
  navigator.geolocation.getCurrentPosition(onLocation, onError);
}

function onLocation(position){
  var myPosition = {
    lat: position.coords.latitude,
    lng: position.coords.longitude

  };
  createMap(myPosition);
}

function onError(err){
  console.log("What are you using, IE 7??", err);
}

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

function createMarker(position) {
  var marker = new google.maps.Marker({
    position: position,
    map: map
  })
};

function createRestaurantMarker(position) {
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
   map.setZoom(17);
   map.setCenter(marker.getPosition());

 });
};

function fetchRestaurants(){
  console.log("hola");
  $.ajax({
    type: 'GET',
    url: "http://localhost:3000/restaurants.json",
    success: function(response){
      response.forEach(function(item){
        var name = item.name;
        var address = item.address;
        var city = item.city;
        var country = item.country;
        var path = "http://maps.google.com/maps/api/geocode/json?address=" + address + "+" + city + "+" + country;
        console.log(path);
        placeRestaurants(path);
      })
    },
    error: function (err) {
      console.log(err);
    }
  });
};


function placeRestaurants(path){
  $.ajax({
    type: 'GET',
    url: path,
    success: function(response) {
      console.log(response);
      var lng = response.results[0].geometry.location.lng;
      var lat = response.results[0].geometry.location.lat;
      var position = { lat,lng };
      createRestaurantMarker(position);
    },
    error: function (err) {
      console.log(err);
    }
  });
}
