var locations = [
      ['Eskişehir Otogarı', 39.777945, 30.55133699999999, 4],
      ['Sakarya Üniversitesi', 40.740922, 30.332891000000018, 5],
      ['İzmit Otogarı', 40.775105, 29.973037999999974, 3],
      ['Serdivan Avm', 40.777863, 30.364735999999994, 2],
      ['Espark Alışveriş Merkezi', 39.783229, 30.511018000000036, 1]
];

var map = new google.maps.Map(document.getElementById('locations-map'), {
    zoom: 6,
    center: new google.maps.LatLng(39.79296, 29.40115),
    mapTypeId: google.maps.MapTypeId.ROADMAP
});

var infowindow = new google.maps.InfoWindow();

var marker, i;

for (i = 0; i < locations.length; i++) {
    marker = new google.maps.Marker({
        position: new google.maps.LatLng(locations[i][1], locations[i][2]),
        map: map
    });

    google.maps.event.addListener(marker, 'click', (function (marker, i) {
        return function () {
            infowindow.setContent(locations[i][0]);
            infowindow.open(map, marker);
        }
    })(marker, i));
}