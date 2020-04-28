$(function(){

  var dataBox = new DataTransfer();

  var file_field = document.querySelector('input[type=file]')

  $('#js-file').change(function(){
    var files = $('input[type="file"]').prop('files')[0];
    $.each(this.files, function(i, file){
      var fileReader = new FileReader();

      dataBox.items.add(file)
      file_field.files = dataBox.files

      var num = $('.item-image').length + 1 + i
      fileReader.readAsDataURL(file);

      if (num == 5){
        $('#js-file_group').css('display', 'none')   
      }
      fileReader.onloadend = function() {
        var src = fileReader.result
        var html= `<div class='item-image' data-image="${file.name}">
                    <div class=' item-image__content'>
                      <div class='item-image__content--icon'>
                        <img src=${src} width="122" height="80" >
                      </div>
                    </div>
                    <div class='item-image__operetion'>
                      <div class='item-image__operetion--delete'>削除</div>
                    </div>
                  </div>`
        
        $('#js-file_group').before(html);
        $('.drop').remove();
      };
  
      $('#js-file_group').attr('class', `item-num-${num}`)
    });
  });

  $(document).on("click", '.item-image__operetion--delete', function(){

    var target_image = $(this).parent().parent()

    var target_name = $(target_image).data('image')
  
    if(file_field.files.length==1){
      
      $('input[type=file]').val(null)
      dataBox.clearData();
      console.log(dataBox)
    }else{
      
      $.each(file_field.files, function(i,input){
        if(input.name==target_name){
          dataBox.items.remove(i) 
        }
      })
      
      file_field.files = dataBox.files
    }
    
    target_image.remove()
    
    var num = $('.item-image').length
    $('#image-box__container').show()
    $('#image-box__container').attr('class', `item-num-${num}`)
    if (num != 5){
      $('#js-file_group').css('display', '')   
    }
  })

  $('#value').on("keyup", function() {
    var value = Number($(this).val());
    if (value >= 300) {
      var fee = Math.floor(value/10);
      var profit = value - fee
      $('.fee__prev').html(fee + "円");
      $('.return__prev').html(profit + "円");
    }
  })

  $('#item_switch').on("change", function() {
    var select = $(this).val();
    if (select == 'draft') {
      $('.item').val('下書きを保存する')
    }else{
      $('.item').val('出品する')
    }
  })

  $('#count').on("keyup", function() {
    var text = $(this).val();
    var num = text.length
    $('.count').html(num + "/1000");
  })

  var dropArea = document.getElementById("js-drag");

  window.onload = function(e){

    dropArea.addEventListener("dragover", function(e){
      e.preventDefault();
      
      $(this).children('#js-file_group').css({'border': '1px solid rgb(204, 204, 204)','box-shadow': '0px 0px 4px'})
    },false);

    dropArea.addEventListener("dragleave", function(e){
      e.preventDefault();

      $(this).children('#js-file_group').css({'border': '1px dashed rgb(204, 204, 204)','box-shadow': '0px 0px 0px'})      
    },false);

    dropArea.addEventListener("drop", function(e) {
      e.preventDefault();
      $(this).children('#js-file_group').css({'border': '1px dashed rgb(204, 204, 204)','box-shadow': '0px 0px 0px'});
      var files = e.dataTransfer.files;

      $.each(files, function(i,file){
        
        var fileReader = new FileReader();
        
        dataBox.items.add(file)
        file_field.files = dataBox.files
        
        var num = $('.item-image').length + i + 1

        fileReader.readAsDataURL(file);

        if (num == 5){
          $('#js-file_group').css('display', 'none')   
        }

        fileReader.onload = function() {

          var src = fileReader.result
          var html =`<div class='item-image' data-image="${file.name}">
                      <div class=' item-image__content'>
                        <div class='item-image__content--icon'>
                          <img src=${src} width="122" height="80" >
                        </div>
                      </div>
                      <div class='item-image__operetion'>
                        <div class='item-image__operetion--delete'>削除</div>
                      </div>
                    </div>`

          $('#js-file_group').before(html);
          $('.drop').remove();
        };

        $('#js-file_group').attr('class', `item-num-${num}`)
      })
    })
  }
});