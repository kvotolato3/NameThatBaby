$(document).ready(function(){
  $('.flip').click(App.flip);
});

var App = App || {};

App.flip = function() {
  $(this).find('.card').addClass('flipped').mouseleave(function(){
    $(this).removeClass('flipped');
    });
  return false;
};



