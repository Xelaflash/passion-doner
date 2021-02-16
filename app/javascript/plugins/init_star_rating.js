import 'jquery-bar-rating';

const initStarRating = () => {
  $('.rating_fields').barrating({
    theme: 'css-stars',
    initialRating: '0',
  });
};

export { initStarRating };
