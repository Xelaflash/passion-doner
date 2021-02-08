import 'jquery-bar-rating';

const initStarRating = () => {
  $('.rating_fields').each(function(index, el) {
    const $El = $(el);
    $El.barrating({
      theme: 'css-stars',
    });
  });
};

export { initStarRating };
