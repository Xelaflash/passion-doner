function autocomplete() {
  document.addEventListener('DOMContentLoaded', function() {
    const kebabAddress = document.getElementById('kebab_address');
    console.log(kebabAddress);

    if (kebabAddress) {
      const autocomplete = new google.maps.places.Autocomplete(kebabAddress, { types: ['geocode'] });
      google.maps.event.addDomListener(kebabAddress, 'keydown', function(e) {
        if (e.key === 'Enter') {
          e.preventDefault(); // Do not submit the form on Enter.
        }
      });
    }
  });
}

export { autocomplete };
