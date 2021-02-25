import { kebabMap } from '../packs/map';

function initTheme() {
  const darkThemeSelected =
    localStorage.getItem('color-theme') !== null && localStorage.getItem('color-theme') === 'dark';
  const prefersDarkScheme = window.matchMedia('(prefers-color-scheme: dark)');
  // ? I add the below block in a one liner but eslint yells at me for unused exp so not a one liner...
  if (darkThemeSelected || prefersDarkScheme.matches) {
    document.documentElement.setAttribute('color-theme', 'dark');
  } else {
    document.documentElement.setAttribute('color-theme', 'light');
  }
}

const toggleColorTheme = e => {
  if (e.currentTarget.classList.contains('light--hidden')) {
    document.documentElement.setAttribute('color-theme', 'light');
    localStorage.setItem('color-theme', 'light');
  } else {
    document.documentElement.setAttribute('color-theme', 'dark');
    localStorage.setItem('color-theme', 'dark');
  }
};

function handleColorClick() {
  const colorThemeBtns = document.querySelectorAll('.color_btn');
  colorThemeBtns.forEach(btn => {
    btn.addEventListener('click', e => {
      toggleColorTheme(e);
      kebabMap();
    });
  });
}

export { initTheme, handleColorClick };
