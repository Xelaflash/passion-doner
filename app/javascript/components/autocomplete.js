/* eslint-disable no-new */
/* eslint-disable no-undef */
function autocomplete() {
  document.addEventListener('turbolinks:load', function() {
    const kebabAddress = document.getElementById('kebab_address');
    const indexSearchField = document.getElementById('query');

    const options = {
      // componentRestrictions: { country: 'fr' },
      strictBounds: false,
      types: ['geocode'],
    };

    if (kebabAddress) {
      new google.maps.places.Autocomplete(kebabAddress, options);
      google.maps.event.addDomListener(kebabAddress, 'keydown', function(e) {
        if (e.key === 'Enter') {
          e.preventDefault(); // Do not submit the form on Enter.
        }
      });
    } else if (indexSearchField) {
      new google.maps.places.Autocomplete(indexSearchField, options);
      google.maps.event.addDomListener(indexSearchField, 'keydown');
    }
  });
}

export { autocomplete };
