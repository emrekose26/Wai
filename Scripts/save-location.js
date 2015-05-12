var lat, lng, place_name,place_adress;

function httpGet(theUrl) {
    var xmlHttp = null;

    xmlHttp = new XMLHttpRequest();
    xmlHttp.open("GET", theUrl, false);
    xmlHttp.send(null);
    return xmlHttp.responseText;
}

function getdata() {

    var lngtext = document.getElementById("lang2");
    var lattext = document.getElementById("lat2");
    var placenametext = document.getElementById("place-name");
    

    var donendgr = httpGet("http://localhost:51397/get-data.aspx?method=save&lang2=" + lngtext.value + "&lat2=" + lattext.value + "&placename=" + placenametext.value);
    if (donendgr == 1) {
        alert('Başarıyla kaydedildi.');
    }
    else {
        alert('Başarısız');
    }

}

function sendTweet() {
    var lngtext = document.getElementById("lang2").value;
    var lattext = document.getElementById("lat2").value;
    var placenametext = document.getElementById("place-name").value;
    var placeadresstext = document.getElementById("place-adress").value;

    var donendgr = httpGet("http://localhost:51397/get-data.aspx?method=sendTweet&lang2=" + lngtext + "&lat2=" + lattext + "&placename=" + placenametext + "&placeadress=" + place_adress);
    if (donendgr == 2) {
        alert('Twit Gönderildi.');
    }
    else {
        alert('Twit gönderme başarısız');
    }
}

 

function initialize() {

    var mapOptions = {
        center: { lat: 39.79296, lng: 29.40115 },
        zoom: 8
    };
    var map = new google.maps.Map(document.getElementById('save-location-map'),
      mapOptions);

    var input = /** @type {HTMLInputElement} */(
        document.getElementById('pac-input'));

    var autocomplete = new google.maps.places.Autocomplete(input);
    autocomplete.bindTo('bounds', map);

    map.controls[google.maps.ControlPosition.TOP_LEFT].push(input);

    var infowindow = new google.maps.InfoWindow();
    var marker = new google.maps.Marker({
        map: map
    });
    google.maps.event.addListener(marker, 'click', function () {
        infowindow.open(map, marker);
    });


    google.maps.event.addListener(marker, 'click', function (e) {
        lat = e.latLng.lat();
        lng = e.latLng.lng();
        document.getElementById('lat2').value = lat;
        document.getElementById('lang2').value = lng;
        getdata();

    });

    google.maps.event.addListener(autocomplete, 'place_changed', function () {
        infowindow.close();
        var place = autocomplete.getPlace();
        if (!place.geometry) {
            return;
        }

        if (place.geometry.viewport) {
            map.fitBounds(place.geometry.viewport);
        } else {
            map.setCenter(place.geometry.location);
            map.setZoom(17);
        }

        // Set the position of the marker using the place ID and location
        marker.setPlace({
            placeId: place.place_id,
            location: place.geometry.location
        });
        marker.setVisible(true);

        infowindow.setContent('<div><strong>' + place.name + '</strong><br>' +
             place.formatted_address);

        place_name = place.name;
        place_adress = place.formatted_address;
        alert("Konumu kaydetmek istiyorsanız konum(marker) üzerine tıklayınız");
        infowindow.open(map, marker);
        document.getElementById('place-name').value = place.name;
        document.getElementById('place-adress').value = place.formatted_address;

    });

}

google.maps.event.addDomListener(window, 'load', initialize);
