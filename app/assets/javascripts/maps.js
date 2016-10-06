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
start();



function start(){
  if ("geolocation" in navigator){
    navigator.geolocation.getCurrentPosition(onLocation, onError);
  }
}



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



function createMap(position){
  map = new google.maps.Map($('#map')[0], {
    mapTypeControl: false,
    streetViewControl: false,
    center: position,
    zoom: 15
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



function createRestaurantMarker(position, id) {
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
   console.log(id);
   $.ajax({
     type: 'GET',
     url: "/restaurants/"+ id +".json",
     success: function(item){
      console.log(item);
      $('#mySidenav').html('<div>' + item.name + '</div>');
      // var name = $('<div>').html(item.name);
      // var address = $('<div>').html(item.address);
      // var city = $('<div>').html(item.city);
      // var country = $('<div>').html(item.country);
      // var email = $('<div>').html(item.email);
      // var phone = $('<div>').html(item.phone);
      // $('#nameRest').html(name);
      // $('#directionRest').html(address);
      // $('#emailRest').html(email);
      // $('#phoneRest').html(phone);

     },
     error: function (err) {
       console.log(err);
     }
   });
 });
};



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




function placeRestaurants(path, id){
  $.ajax({
    type: 'GET',
    url: path,
    success: function(response) {
      var lng = response.results[0].geometry.location.lng;
      var lat = response.results[0].geometry.location.lat;
      var position = { lat,lng };
      createRestaurantMarker(position, id);
    },
    error: function (err) {
      console.log(err);
    }
  });
}
