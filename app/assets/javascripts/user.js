$(document).on('turbolinks:load', function(){
  $(function(){
    
    $('.user__input__password').on('change', function() {
      $('.passprev').val("");
      var pass = $('#password').val();
      $('.passprev').append(pass);
    })
  });
});