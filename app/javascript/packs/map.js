// Gmaps display
import GMaps from 'gmaps/gmaps.js';

const mapElement = document.getElementById('map');
if (mapElement) { // don't try to build a map if there's no div#map to inject in
  const map = new GMaps({ el: '#map', lat: 0, lng: 0 });
  const markers = JSON.parse(mapElement.dataset.markers);

  // To change icons: comment to come back to google red pins
  var image = 'http://res.cloudinary.com/dixy9tipv/image/upload/c_scale,h_50/v1520948069/152094739257384144.png'
  markers.forEach(function(marker){
    marker.icon = image;
  });

  map.addMarkers(markers);
  if (markers.length === 0) {
    map.setZoom(2);
  } else if (markers.length === 1) {
    map.setCenter(markers[0].lat, markers[0].lng);
    map.setZoom(8);
  } else {
    map.fitLatLngBounds(markers);
  }
  // Snazzy maps style
  const styles = [
    {
        "featureType": "administrative.country",
        "elementType": "geometry",
        "stylers": [
            {
                "visibility": "simplified"
            },
            {
                "hue": "#ff0000"
            }
        ]
    }
]
  map.addStyle({
    styles: styles,
    mapTypeId: 'map_style'
  });
  map.setStyle('map_style');
}

