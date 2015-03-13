$(document).ready(function(){
  $('.flip').click(App.flip);
  $('.unlock-answers').click(App.unlockAnswers);
  $('.lock-answers').click(App.lockAnswers);
});

var App = App || {};

var locked = true;

App.flip = function() {
  if (locked === false) {
    $(this).find('.card').addClass('flipped').mouseleave(function(){
    $(this).removeClass('flipped');
    });
  return false;
  };
};

App.unlockAnswers = function() {
  var $pw = $('#pw');
  var isHidden = $pw.is(':hidden');
  if (isHidden === true) {
    $pw.toggle();
  } else {
    var guess = $pw.val();
    if (guess === 'jose') {
      locked = false;
      $('.lock-answers').toggle();
      $('.unlock-answers').toggle();
      $pw.toggle().val('');
    } else if (guess === '') {
      $pw.toggle();
    };
  };
};

App.lockAnswers = function() {
  locked = true;
  $('.lock-answers').toggle();
  $('.unlock-answers').toggle();
};

