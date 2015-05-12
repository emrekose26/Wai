var elevator;
var map;
var infowindow = new google.maps.InfoWindow();

function initialize() {
    var mapOptions = {
        zoom: 5,
        center: new google.maps.LatLng(39.79296, 29.40115),
        mapTypeId: 'terrain'
    }
    map = new google.maps.Map(document.getElementById('get-elevation'), mapOptions);

    // Create an ElevationService
    elevator = new google.maps.ElevationService();

    // Add a listener for the click event and call getElevation on that location
    google.maps.event.addListener(map, 'click', getElevation);
}

function getElevation(event) {

    var locations = [];

    // Retrieve the clicked location and push it on the array
    var clickedLocation = event.latLng;
    locations.push(clickedLocation);

    // Create a LocationElevationRequest object using the array's one value
    var positionalRequest = {
        'locations': locations
    }

    // Initiate the location request
    elevator.getElevationForLocations(positionalRequest, function (results, status) {
        if (status == google.maps.ElevationStatus.OK) {

            // Retrieve the first result
            if (results[0]) {

                // Open an info window indicating the elevation at the clicked position
                infowindow.setContent('Yükseklik (Rakım) <br> ' + results[0].elevation + ' metre.');
                infowindow.setPosition(clickedLocation);
                infowindow.open(map);
            } else {
                alert('Sonuç bulunamadı');
            }
        } else {
            alert('Elevation service kullanılamıyor: ' + status);
        }
    });
}

google.maps.event.addDomListener(window, 'load', initialize);