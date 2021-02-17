import 'bootstrap';
import { initStarRating } from '../plugins/init_star_rating';
import { previewImageOnFileSelect } from '../components/photo_preview';
import { kebabMap } from './map';

global.$ = jQuery;

require('@rails/ujs').start();
require('turbolinks').start();
require('@rails/activestorage').start();

$(document).on('turbolinks:load', function() {
  setTimeout(function() {
    $('.alert').fadeOut('slow');
  }, 4000);
});

document.addEventListener('turbolinks:load', function() {
  kebabMap();
  initStarRating();
  previewImageOnFileSelect();
});
