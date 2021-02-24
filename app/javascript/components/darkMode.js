const toggleSwitch = document.querySelector('.theme-switch input[type="checkbox"]');

function initTheme() {
  const darkThemeSelected =
    localStorage.getItem('toggleSwitch') !== null && localStorage.getItem('toggleSwitch') === 'dark';
  // update checkbox
  toggleSwitch.checked = darkThemeSelected;
  // update body data-theme attribute
  darkThemeSelected ? document.body.setAttribute('data-theme', 'dark') : document.body.removeAttribute('data-theme');
}

function resetTheme() {
  if (toggleSwitch.checked) {
    // dark theme has been selected
    document.body.setAttribute('data-theme', 'dark');
    localStorage.setItem('toggleSwitch', 'dark'); // save theme selection
  } else {
    document.body.removeAttribute('data-theme');
    localStorage.removeItem('toggleSwitch'); // reset theme selection
  }
}

function setTheme() {
  if (toggleSwitch) {
    initTheme(); // on page load, if user has already selected a specific theme -> apply it
    toggleSwitch.addEventListener('change', function() {
      resetTheme(); // update color theme
    });
  }
}

export { setTheme };
