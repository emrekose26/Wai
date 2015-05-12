var map;
var pos;

function initialize() {
    var mapOptions = {
        center: pos,
        zoom: 15,
        mapTypeId: google.maps.MapTypeId.ROADMAP
    };
    map = new google.maps.Map(document.getElementById('geo-map'),
        mapOptions);

    var marker = new google.maps.Marker({
        position: pos,
        animation: google.maps.Animation.BOUNCE
    });



    // Try HTML5 geolocation
    if (navigator.geolocation) {
        navigator.geolocation.getCurrentPosition(function (position) {
            pos = new google.maps.LatLng(position.coords.latitude,
                                             position.coords.longitude);

            var infowindow = new google.maps.InfoWindow({
                map: map,
                position: pos,
                content: 'Suanda Buradasiniz'
            });


            map.setCenter(pos);
        }, function () {
            handleNoGeolocation(true);
        });
    } else {
        // Browser Geolocation desteklemiyor
        handleNoGeolocation(false);
    }
}

//hata olduğunda çalışacak fonksiyon
function handleNoGeolocation(errorFlag) {
    if (errorFlag) {
        var content = 'Hata: Geolocation servisi çalışmadı';
    } else {
        var content = 'Hata : Suan kullandiginiz browser Geolocation desteklemiyor';
    }

    var options = {
        map: map,
        position: new google.maps.LatLng(60, 105),
        content: content
    };

    var infowindow = new google.maps.InfoWindow(options);
    map.setCenter(options.position);
}

google.maps.event.addDomListener(window, 'load', initialize);