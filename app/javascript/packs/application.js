// import './hello_react';
import 'bootstrap';
import { initStarRating } from '../plugins/init_star_rating';

require('@rails/ujs').start();
require('turbolinks').start();
require('@rails/activestorage').start();

$(function() {
  setTimeout(function() {
    $('.alert').fadeOut('slow');
  }, 5000);
});

initStarRating();
