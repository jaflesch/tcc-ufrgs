function myMap() {
    var latitude = -29.17028;
    var longitude = -51.18655;

    var mapCanvas = document.getElementById("gmap");
    var mapOptions = {
        center: new google.maps.LatLng(latitude, longitude),
        zoom: 17
    };

    var myCenter = new google.maps.LatLng(latitude - 0.000515, longitude - 0.0005115);
    var marker = new google.maps.Marker({position: myCenter});

    var infowindow = new google.maps.InfoWindow({
	    content: "<strong>Argo Sistemas</strong><br/> Rua Coronel Flores, 749, Sala 703 - Caxias do Sul / RS"
  	});

    var map = new google.maps.Map(mapCanvas, mapOptions);
    marker.setMap(map);
  	infowindow.open(map,marker);
}