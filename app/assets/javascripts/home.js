var x = document.getElementById(('error-message'));

function getLocation() {
    if (navigator.geolocation) {
        navigator.geolocation.watchPosition(success, error);
    } else {
        x.innerHTML = "Geolocation is not supported by this browser.";
    }
}
function success(position) {
    var cookie_val = position.coords.latitude + "|" + position.coords.longitude;
    // console.log(Cookies.get('lat_lng')); // => 'value'
    window.location = '/?lat_long=' + encodeURI(cookie_val);
}

function error(error) {
    switch(error.code) {
        case error.PERMISSION_DENIED:
            x.innerHTML = "User denied the request for Geolocation.";
            break;
        case error.POSITION_UNAVAILABLE:
            x.innerHTML = "Location information is unavailable.";
            break;
        case error.TIMEOUT:
            x.innerHTML = "The request to get user location timed out.";
            break;
        case error.UNKNOWN_ERROR:
            x.innerHTML = "An unknown error occurred.";
            break;
    }
}