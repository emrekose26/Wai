var map;
var directionsService;
var directionsRenderer;
           
function initialize() {
    map = new google.maps.Map(document.getElementById("get-distance-map"), {
        zoom: 7,
        mapTypeId: google.maps.MapTypeId.ROADMAP,
        center: new google.maps.LatLng(-33.868011, 151207566)
    });
 
    directionsRenderer = new google.maps.DirectionsRenderer();
    directionsRenderer.setMap(map);    
    directionsRenderer.setPanel(document.getElementById('directions'));
 
    directionsService = new google.maps.DirectionsService();
               
    Form=document.forms['harita'];
    YolTarifi(Form.elements['nerden'].value, Form.elements['nereye'].value);
           
}
       
function YolTarifi(Nerden, Nereye) {
    var request = {
        origin: Nerden,
        destination: Nereye,
        travelMode: google.maps.DirectionsTravelMode.DRIVING,
        unitSystem: google.maps.DirectionsUnitSystem.METRIC
    };
           
    directionsService.route(request, function(response, status) {
        if (status == google.maps.DirectionsStatus.OK) {
            directionsRenderer.setDirections(response);
        } else {
            alert('Yol Tarifi Oluşturulamadı');
            }
    });
}
 
       