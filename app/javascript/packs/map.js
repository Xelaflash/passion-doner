import { autocomplete } from '../components/autocomplete';

const kebabMap = () => {
  const mapElement = document.getElementById('map');
  if (mapElement) {
    const map = new GMaps({ el: '#map', lat: 0, lng: 0 });
    // don't try to build a map if there's no div#map to inject in
    const markers = JSON.parse(mapElement.dataset.markers);
    map.addMarkers(markers);

    if (markers.length === 0) {
      navigator.geolocation.getCurrentPosition(function(position) {
        const currPosLat = position.coords.latitude;
        const currPosLng = position.coords.longitude;
        map.setCenter(currPosLat, currPosLng);
        map.setZoom(11);
      });
    } else if (markers.length === 1) {
      map.setCenter(markers[0].lat, markers[0].lng);
      map.setZoom(13);
    } else {
      map.fitLatLngBounds(markers);
    }
  }
};
autocomplete();
export { kebabMap };
