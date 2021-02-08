// import './hello_react';
import 'bootstrap';
import { initStarRating } from '../plugins/init_star_rating';

$(function() {
  setTimeout(function() {
    $('.alert').fadeOut('slow');
  }, 5000);
});

initStarRating();
