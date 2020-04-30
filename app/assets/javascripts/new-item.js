$(function(){

  function buildHTML(count) {
    var html = `<div class="preview-box" id="preview-box__${count}">
                  <img src="" alt="preview" width="122" height="90">
                </div>`
    return html;
  }

  function setLabel() {

    var prevContent = $('.label-content').prev();
    labelWidth = (660 - $(prevContent).css('width').replace(/[^0-9]/g, ''));
    $('.label-content').css('width', labelWidth);
  }

  $(document).on('change', '.hidden', function() {
    setLabel();

    var id = $(this).attr('id').replace(/[^0-9]/g, '');

    $('.label').attr({id: `label-box--${id}`,for: `item_images_attributes_${id}_image`});

    var file = this.files[0];
    var reader = new FileReader();

    reader.readAsDataURL(file);

    reader.onload = function() {
      var image = this.result;

      if ($(`#preview-box__${id}`).length == 0) {
        var count = $('.preview-box').length;
        var html = buildHTML(id);
    
        $('#js-file_group').append(html);
      }

      $(`#preview-box__${id} img`).attr('src', `${image}`);
      var count = $('.preview-box').length;

      if (count == 5) { 
        $('.label-content').css('display', 'none')
      }


      setLabel();

      if(count < 6){
        $('.label').attr({id: `label-box--${count}`,for: `item_images_attributes_${count}_image`});
      }
      if(count > 0){
        $('.drop').hide();
      }
    }
  });

  $('.delete-btn').on('click', function() {
    var count = $('.preview-box').length;
    setLabel(count);

    var id = $('.label').attr('id').replace(/[^0-9]/g, '');
    var id = id - 1
  
    $(`#preview-box__${id}`).remove();
  
    $(`#item_images_attributes_${id}_image`).val("");


    var count = $('.preview-box').length;

    if (count == 4) {
      $('.label-content').css('display', '')
    }
    if(count == 0){
      $('.drop').show();
    }
    setLabel(count);

    if(id < 5){
      $('.label').attr({id: `label-box--${id}`,for: `item_images_attributes_${id}_image`});
    }
  });

  $('#count').on("keyup", function() {
    var text = $(this).val();
    var num = text.length
    $('.count').html(num + "/1000");
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


  // 以下ドラッグ&ドロップについての記述
  // var dropArea = document.getElementById("js-drag");

  // window.onload = function(e){

  //   dropArea.addEventListener("dragover", function(e){
  //     e.preventDefault();
      
  //     $(this).children('.label-content').css({'border': '1px solid rgb(204, 204, 204)','box-shadow': '0px 0px 4px'})
  //   },false);

  //   dropArea.addEventListener("dragleave", function(e){
  //     e.preventDefault();

  //     $(this).children('.label-content').css({'border': '1px dashed rgb(204, 204, 204)','box-shadow': '0px 0px 0px'})      
  //   },false);

  //   dropArea.addEventListener("drop", function(e) {
  //     e.preventDefault();
  //     $(this).children('.label-content').css({'border': '1px dashed rgb(204, 204, 204)','box-shadow': '0px 0px 0px'});
  //     var files = e.dataTransfer.files;

  //     function setLabel() {

  //       var prevContent = $('.label-content').prev();
  //       labelWidth = (660 - $(prevContent).css('width').replace(/[^0-9]/g, ''));
  //       $('.label-content').css('width', labelWidth);
  //     }
  //     setLabel();
  //     var file = this.files[0];
  //     var reader = new FileReader();

  //     reader.readAsDataURL(file);

  //     // $.each(files, function(i,file){
        
  //     //   var fileReader = new FileReader();
        
  //     //   dataBox.items.add(file)
  //     //   file_field.files = dataBox.files
        
  //     //   var num = $('.item-image').length + i + 1

  //     //   fileReader.readAsDataURL(file);

  //     //   if (num == 5){
  //     //     $('#js-file_group').css('display', 'none')   
  //     //   }

  //     //   fileReader.onload = function() {

  //     //     var src = fileReader.result
  //     //     var html =`<div class='item-image' data-image="${file.name}">
  //     //                 <div class=' item-image__content'>
  //     //                   <div class='item-image__content--icon'>
  //     //                     <img src=${src} width="122" height="80" >
  //     //                   </div>
  //     //                 </div>
  //     //                 <div class='item-image__operetion'>
  //     //                   <div class='item-image__operetion--delete'>削除</div>
  //     //                 </div>
  //     //               </div>`

  //     //     $('#js-file_group').before(html);
  //     //     $('.drop').remove();
  //     //   };

  //     //   $('#js-file_group').attr('class', `item-num-${num}`)
  //     // })
  //   })
  // }
});