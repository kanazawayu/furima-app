$(document).on('turbolinks:load', function(){
  $(function(){
    
    $('.user__input__password').on('change', function() {
      $('.passprev').html("");
      var pass = $('#password').val();
      var check = $(this).prop('checked');
      if (check == true) {
        $('.passprev').append(pass);
      }
    })
  });
});