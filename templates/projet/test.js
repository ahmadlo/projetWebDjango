
function include(fileName){
document.write("<script type='text/javascript' src='"+fileName+"'></script>" );
}
var map;
/*function initialize() {
    map = new google.maps.Map(document.getElementById('map'), {
        zoom: 5,
        center: new google.maps.LatLng(41.879535, -87.624333),
        mapTypeId: google.maps.MapTypeId.ROADMAP
    });
}*/
function testClients(tableau)
{
	alert(tableau.toString());
}
 function initMap() {
 	//document.getElementById("affich").innerHTML = "bismilahi rahmani rahimi";
include("https://maps.googleapis.com/maps/api/js?key=AIzaSyA7mZ4cM_XBNPlo28nwl3xJW2DHxAPC2ok")
        var map = new google.maps.Map(document.getElementById('map'), {
          center: {lat: -34.397, lng: 150.644},
          zoom: 16,
          mapTypeId:google.maps.MapTypeId.SATELLITE
        });
        //var infoWindow = new google.maps.InfoWindow({map: map});

        // Try HTML5 geolocation.
        if (navigator.geolocation) {
          navigator.geolocation.getCurrentPosition(function(position) {
          	     var latt=position.coords.latitude
            	var long=position.coords.longitude

            var pos = {
              lat: position.coords.latitude,
              lng: position.coords.longitude
            };
var marker = new google.maps.Marker({
    position: pos,
    map: map,
    title: 'Mangui fi ni ! latitude:latt longitude:long'
  });
            /*infoWindow.setPosition(pos);
            infoWindow.setContent('Location found.');*/
            map.setCenter(pos);
          }/*, function() {
            handleLocationError(true, infoWindow, map.getCenter());
          }*/);
        } /*else {
          // Browser doesn't support Geolocation
          handleLocationError(false, infoWindow, map.getCenter());
        }*/
        
      }
</script>