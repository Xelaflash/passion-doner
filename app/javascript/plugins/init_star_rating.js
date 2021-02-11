import 'jquery-bar-rating';

// const initStarRating = () => {
//   $('.rating_fields').each(function(index, el) {
//     const $El = $(el);
//     $El.barrating({
//       theme: 'css-stars',
//     });
//   });
// };

const initStarRating = () => {
  $('.rating_fields').barrating({
    theme: 'css-stars',
    initialRating: '0',
  });
};

export { initStarRating };
