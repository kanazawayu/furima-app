$(document).on('turbolinks:load', function(){
  $(function(){
    $('.showprev').on("click", function() {
      var img = $(this).attr('src')
      $('.item-photo').html(`<img src="${img}">`)
    })
  });
});