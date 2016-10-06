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
   $.ajax({
     type: 'GET',
     url: "/restaurants/"+ id +".json",
     success: function(item){
      var actualSeason = currentSeason();
      console.log(item.menus);
      if (item.menus.length == 0){
        $('#menu').html(" ");
      } else {
        item.menus.forEach(function(menu){
          if (menu.season === actualSeason[0]){
            $('#menu').html(menu.name);
          }
        })
      }
      $('#nameRest').html('<div>' + item.name + '</div>');
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
