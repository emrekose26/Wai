var map;
function initialize() {
    var mapOptions = {
        zoom: 5,
        center: new google.maps.LatLng(39.79296, 29.40115)
    };
    map = new google.maps.Map(document.getElementById('simple-map'),
        mapOptions);
}

google.maps.event.addDomListener(window, 'load', initialize);