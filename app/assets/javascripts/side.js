$(document).on('turbolinks:load', function(){
  $(function(){
    
    $('.side__mypage__list__item').hover(
      function() {
        $(this).css('background-color', 'lightgrey');
        $(this).children('#check').css('display', 'unset');
      }, function() {
        $(this).css('background-color', 'white');
        $(this).children('#check').css('display', 'none');
      }
    );
    
  });
});