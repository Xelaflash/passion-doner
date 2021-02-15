import 'bootstrap';
import { initStarRating } from '../plugins/init_star_rating';
import { previewImageOnFileSelect } from '../components/photo_preview';
import { kebabMap } from './map';

require('@rails/ujs').start();
require('turbolinks').start();
require('@rails/activestorage').start();

$(function() {
  setTimeout(function() {
    $('.alert').fadeOut('slow');
  }, 5000);
});

document.addEventListener('turbolinks:load', function() {
  kebabMap();

  initStarRating();
  previewImageOnFileSelect();
});
