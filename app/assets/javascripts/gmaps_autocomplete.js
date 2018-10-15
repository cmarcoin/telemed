document.addEventListener('DOMContentLoaded', function () {
  let addressField = document.getElementsByClassName('address-field')[0];

  if (addressField) {
    let autocomplete = new google.maps.places.Autocomplete(addressField, {
      types: ["geocode"],
      componentRestrictions: {
        country: "fr"
      }
    });
    google.maps.event.addListener(
      autocomplete,
      "place_changed",
      onPlaceChanged
    );
    google.maps.event.addDomListener(addressField, "keydown", function (e) {
      if (e.keyCode == 13) {
        e.preventDefault(); // Do not submit the form on Enter.
      }
    });
  }

  function onPlaceChanged() {

    let place = this.getPlace();
    let components = getAddressComponents(place);

    // Need to check if this works for all pages. Might not work for pages where there are two address fields
    document.getElementById('lat').value = place.geometry.location.lat();
    document.getElementById('lng').value = place.geometry.location.lng();
    document.getElementById('address_line1').value = components.address;
    document.getElementById('zip_code').value = components.zip_code;
    document.getElementById('city').value = components.city;

    if (components.country_code) {
      document.getElementById('country').value = components.country_code;
    }
  }

  function getAddressComponents(place) {
    let lat = place.geometry.location.lat();
    let lng = place.geometry.location.lng();
    let street_number = null;
    let route = null;
    let zip_code = null;
    let city = null;
    let country_code = null;
    for (let i in place.address_components) {
      let component = place.address_components[i];
      for (let j in component.types) {
        let type = component.types[j];
        if (type == "street_number") {
          street_number = component.long_name;
        } else if (type == "route") {
          route = component.long_name;
        } else if (type == "postal_code") {
          zip_code = component.long_name;
        } else if (type == "locality") {
          city = component.long_name;
        } else if (type == "country") {
          country_code = component.short_name;
        }
      }
    }

    return {
      address: street_number == null ? route : street_number + " " + route,
      zip_code: zip_code,
      city: city,
      country_code: country_code
    };
  }
});