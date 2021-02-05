import './hello_react';

require('@rails/ujs').start();
require('turbolinks').start();
require('@rails/activestorage').start();
// require('channels');

// search form
const input = document.getElementById('search-input');
const searchBtn = document.getElementById('search-btn');

const expand = () => {
  searchBtn.classList.toggle('close');
  input.classList.toggle('square');
};

searchBtn.addEventListener('click', expand);
