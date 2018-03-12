function autocomplete() {
  document.addEventListener("DOMContentLoaded", function() {
    var warehouseAddress = document.getElementById('warehouse_address');

    if (warehouseAddress) {
      var autocomplete = new google.maps.places.Autocomplete(warehouseAddress, { types: [ 'geocode' ] });
      google.maps.event.addDomListener(warehouseAddress, 'keydown', function(e) {
        if (e.key === "Enter") {
          e.preventDefault(); // Do not submit the form on Enter.
        }
      });
    }
  });
}

export { autocomplete };
