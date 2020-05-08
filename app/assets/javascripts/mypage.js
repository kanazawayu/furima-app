$(function() {
  $('.myitem__btn__right').on("click", function() {
    $(this).css('background-color', 'white');
    $('.myitem__btn__left').css('background-color', 'lightgrey');
    $('.myitem__btn__left').css('border-top', '2px none red');
    $('.myitem__btn__right').css('border-top', '2px solid red');
    
    $('.tab').css('display', 'none')
    $('.tab-2').show();
  })

  $('.myitem__btn__left').on("click", function() {
    $(this).css('background-color', 'white');
    $('.myitem__btn__right').css('background-color', 'lightgrey');
    $('.myitem__btn__right').css('border-top', '2px none red');
    $('.myitem__btn__left').css('border-top', '2px solid red');

    $('.tab-2').css('display', 'none')
    $('.tab').show();
  })
})