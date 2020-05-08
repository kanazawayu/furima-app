$(document).on('turbolinks:load', function(){
  $(function(){

    function buildHTML(count) {
      var html = `<div class="preview-box" id="preview-box__${count}">
                    <div class="upper-box">
                      <img src="" alt="preview" width="122" height="90">
                    </div>
                    <div class="lower-box">
                      <div class="destroy-box" id="destroy_btn_${count}">
                        <span>削除</span>
                      </div>
                    </div>
                  </div>`
      return html;
    }
    function buildPOP(id, img) {
      var html = `<div class="popup__content">
                    <div class="popup__content__title">
                      <div class="popup__content__title__edit">
                        <label class="label-box" id="label-box--${id}" for="item_images_attributes_${id}_image">
                          <span>
                            <i class="fa fa-edit"></i>
                            画像を編集する
                          </span>
                        </label>
                      </div>
                      <span class="destroy-box" id="destroy_btn_${id}">
                        <i class="fa fa-trash"></i>
                        削除
                      </span>
                    </div>
                    <div class="popup__content__image__${id}">
                      <img src="${img}" alt="" height="350" width="500">
                    </div>
                    <div class="popup__content__btn">
                      <div class="closebtn">
                        閉じる
                      </div>
                    </div>
                  </div>`
      return html;
    }

    if (window.location.href.match(/\/items\/\d+\/edit/)){

      $('.preview-box').each(function(index, box){
        $(box).attr('id', `preview-box__${index}`);
      })

      $('.previmage').each(function(index, box){
        $(box).attr('id', `previmage__${index}`);
      })

      $('.update-box').each(function(index, box){
        $(box).attr('id', `update_btn_${index}`);
      })

      var count = $('.preview-box').length;

      if (count == 5) {
        $('.label-content').hide();
      }
      
      if (count != 0){
        $('.drop').hide();
      }
    }

    function setLabel() {

      var prevContent = $('.label-content').prev();
      labelWidth = (660 - $(prevContent).css('width').replace(/[^0-9]/g, ''));
      $('.label-content').css('width', labelWidth);
    }

    $(document).on('change', '.hidden-field', function() {
      $('.drop').hide();
      setLabel();

      var id = $(this).attr('id').replace(/[^0-9]/g, '');

      $('.label-box').attr({id: `label-box--${id}`,for: `item_images_attributes_${id}_image`});

      var file = this.files[0];
      var reader = new FileReader();

      reader.readAsDataURL(file);

      reader.onload = function() {
        var image = this.result;

        if ($(`#preview-box__${id}`).length == 0) {
          var count = $('.preview-box').length;
          var html = buildHTML(id);

          var prevContent = $('.label-content').prev();
          $(prevContent).append(html);
        }

        $(`#preview-box__${id} img`).attr('src', `${image}`);
        $(`.popup__content__image__${id} img`).attr(`src`, `${image}`);
        var count = $('.preview-box').length;

        if (count == 5) { 
          $('.label-content').hide();
        }


        if ($(`#item_images_attributes_${id}__destroy`)){
          $(`#item_images_attributes_${id}__destroy`).prop('checked',false);
        } 

        setLabel();

        if(count < 5){
          $('.label-box').attr({id: `label-box--${count}`,for: `item_images_attributes_${count}_image`});
        }
      }
    });

    $(document).on('click', '.update-box', function() {
      $('.popup').addClass('show').fadeIn();
      var id = $(this).attr('id').replace(/[^0-9]/g, '');
      var img = $(`#previmage__${id}`).attr('src');
      var html = buildPOP(id, img, count);
      $('.popup').html(html);
    })

    $(document).on('click', '.closebtn', function() {
      $('.popup').hide();
    })

    window.onload = function(){
      $(document).on('click', '.destroy-box', function() {
        var count = $('.preview-box').length;
        setLabel(count);
        var id = $(this).attr('id').replace(/[^0-9]/g, '');
        $(`#preview-box__${id}`).remove();
        $(".popup").hide();
        if ($(`#item_images_attributes_${id}__destroy`).length == 0) {
          $(`#item_images_attributes_${id}_image`).val("");

          if(id == 0){

            $('input[name="item[images_attributes][0][_destroy]"]').appendTo('.hidden-content')
            $('#item_images_attributes_0__destroy').appendTo('.hidden-content')
            $('#item_images_attributes_0_id').appendTo('.hidden-content')
            $('#item_images_attributes_0_image').appendTo('.hidden-content')



            $('#item_images_attributes_1_image').attr({id: `item_images_attributes_0_image`,name: `item[images_attributes][0][image]`});
            $('input[name="item[images_attributes][1][_destroy]"]').attr({name: `item[images_attributes][0][_destroy]`});
            $('#item_images_attributes_1__destroy').attr({id: `item_images_attributes_0__destroy`,name: `item[images_attributes][0][_destroy]`});
            $('#item_images_attributes_1_id').attr({id: `item_images_attributes_0_id`,name: `item[images_attributes][0][id]`});

            $('#item_images_attributes_2_image').attr({id: `item_images_attributes_1_image`,name: `item[images_attributes][1][image]`});
            $('input[name="item[images_attributes][2][_destroy]"]').attr({name: `item[images_attributes][1][_destroy]`});
            $('#item_images_attributes_2__destroy').attr({id: `item_images_attributes_1__destroy`,name: `item[images_attributes][1][_destroy]`});
            $('#item_images_attributes_2_id').attr({id: `item_images_attributes_1_id`,name: `item[images_attributes][1][id]`});

            $('#item_images_attributes_3_image').attr({id: `item_images_attributes_2_image`,name: `item[images_attributes][2][image]`});
            $('input[name="item[images_attributes][3][_destroy]"]').attr({name: `item[images_attributes][2][_destroy]`});
            $('#item_images_attributes_3__destroy').attr({id: `item_images_attributes_2__destroy`,name: `item[images_attributes][2][_destroy]`});
            $('#item_images_attributes_3_id').attr({id: `item_images_attributes_2_id`,name: `item[images_attributes][2][id]`});

            $('#item_images_attributes_4_image').attr({id: `item_images_attributes_3_image`,name: `item[images_attributes][3][image]`});
            $('input[name="item[images_attributes][4][_destroy]"]').attr({name: `item[images_attributes][3][_destroy]`});
            $('#item_images_attributes_4__destroy').attr({id: `item_images_attributes_3__destroy`,name: `item[images_attributes][3][_destroy]`});
            $('#item_images_attributes_4_id').attr({id: `item_images_attributes_3_id`,name: `item[images_attributes][3][id]`});



            $('.hidden-content input:last').attr({id: `item_images_attributes_4_image`,name: `item[images_attributes][4][image]`});

            if ($('.hidden-content input').eq(-2).attr('id').match(/0/)){
              $('.hidden-content input').eq(-2).attr({id: `item_images_attributes_4_id`,name: `item[images_attributes][4][id]`});
            }

            if ($('.hidden-content input').eq(-3).attr('id').match(/0/)){
              $('.hidden-content input').eq(-3).attr({id: `item_images_attributes_4__destroy`,name: `item[images_attributes][4][_destroy]`});
            }

            if ($('.hidden-content input').eq(-4).attr('name').match(/0/)){
              $('.hidden-content input').eq(-4).attr({name: `item[images_attributes][4][_destroy]`});
            } 



            $('#preview-box__1').attr({id: `preview-box__0`});
            $('#previmage__1').attr({id: `previmage__0`});
            $('#update_btn_1').attr({id: `update_btn_0`});
            $('#destroy_btn_1').attr({id: `destroy_btn_0`});

            $('#preview-box__2').attr({id: `preview-box__1`});
            $('#previmage__2').attr({id: `previmage__1`});
            $('#update_btn_2').attr({id: `update_btn_1`});
            $('#destroy_btn_2').attr({id: `destroy_btn_1`});

            $('#preview-box__3').attr({id: `preview-box__2`});
            $('#previmage__3').attr({id: `previmage__2`});
            $('#update_btn_3').attr({id: `update_btn_2`});
            $('#destroy_btn_3').attr({id: `destroy_btn_2`});

            $('#preview-box__4').attr({id: `preview-box__3`});
            $('#previmage__4').attr({id: `previmage__3`});
            $('#update_btn_4').attr({id: `update_btn_3`});
            $('#destroy_btn_4').attr({id: `destroy_btn_3`});

          }else if(id == 1){

            $('input[name="item[images_attributes][1][_destroy]"]').appendTo('.hidden-content')
            $('#item_images_attributes_1__destroy').appendTo('.hidden-content')
            $('#item_images_attributes_1_id').appendTo('.hidden-content')
            $('#item_images_attributes_1_image').appendTo('.hidden-content')



            $('#item_images_attributes_2_image').attr({id: `item_images_attributes_1_image`,name: `item[images_attributes][1][image]`});
            $('input[name="item[images_attributes][2][_destroy]"]').attr({name: `item[images_attributes][1][_destroy]`});
            $('#item_images_attributes_2__destroy').attr({id: `item_images_attributes_1__destroy`,name: `item[images_attributes][1][_destroy]`});
            $('#item_images_attributes_2_id').attr({id: `item_images_attributes_1_id`,name: `item[images_attributes][1][id]`});

            $('#item_images_attributes_3_image').attr({id: `item_images_attributes_2_image`,name: `item[images_attributes][2][image]`});
            $('input[name="item[images_attributes][3][_destroy]"]').attr({name: `item[images_attributes][2][_destroy]`});
            $('#item_images_attributes_3__destroy').attr({id: `item_images_attributes_2__destroy`,name: `item[images_attributes][2][_destroy]`});
            $('#item_images_attributes_3_id').attr({id: `item_images_attributes_2_id`,name: `item[images_attributes][2][id]`});

            $('#item_images_attributes_4_image').attr({id: `item_images_attributes_3_image`,name: `item[images_attributes][3][image]`});
            $('input[name="item[images_attributes][4][_destroy]"]').attr({name: `item[images_attributes][3][_destroy]`});
            $('#item_images_attributes_4__destroy').attr({id: `item_images_attributes_3__destroy`,name: `item[images_attributes][3][_destroy]`});
            $('#item_images_attributes_4_id').attr({id: `item_images_attributes_3_id`,name: `item[images_attributes][3][id]`});

            
            $('.hidden-content input:last').attr({id: `item_images_attributes_4_image`,name: `item[images_attributes][4][image]`});

            if ($('.hidden-content input').eq(-2).attr('id').match(/1/)){
              $('.hidden-content input').eq(-2).attr({id: `item_images_attributes_4_id`,name: `item[images_attributes][4][id]`});
            }

            if ($('.hidden-content input').eq(-3).attr('id').match(/1/)){
              $('.hidden-content input').eq(-3).attr({id: `item_images_attributes_4__destroy`,name: `item[images_attributes][4][_destroy]`});
            }

            if ($('.hidden-content input').eq(-4).attr('name').match(/1/)){
              $('.hidden-content input').eq(-4).attr({name: `item[images_attributes][4][_destroy]`});
            } 


            $('#preview-box__2').attr({id: `preview-box__1`});
            $('#previmage__2').attr({id: `previmage__1`});
            $('#update_btn_2').attr({id: `update_btn_1`});
            $('#destroy_btn_2').attr({id: `destroy_btn_1`});

            $('#preview-box__3').attr({id: `preview-box__2`});
            $('#previmage__3').attr({id: `previmage__2`});
            $('#update_btn_3').attr({id: `update_btn_2`});
            $('#destroy_btn_3').attr({id: `destroy_btn_2`});

            $('#preview-box__4').attr({id: `preview-box__3`});
            $('#previmage__4').attr({id: `previmage__3`});
            $('#update_btn_4').attr({id: `update_btn_3`});
            $('#destroy_btn_4').attr({id: `destroy_btn_3`});

          }else if(id == 2){

            $('input[name="item[images_attributes][2][_destroy]"]').appendTo('.hidden-content')
            $('#item_images_attributes_2__destroy').appendTo('.hidden-content')
            $('#item_images_attributes_2_id').appendTo('.hidden-content')
            $('#item_images_attributes_2_image').appendTo('.hidden-content')


            $('#item_images_attributes_3_image').attr({id: `item_images_attributes_2_image`,name: `item[images_attributes][2][image]`});
            $('input[name="item[images_attributes][3][_destroy]"]').attr({name: `item[images_attributes][2][_destroy]`});
            $('#item_images_attributes_3__destroy').attr({id: `item_images_attributes_2__destroy`,name: `item[images_attributes][2][_destroy]`});
            $('#item_images_attributes_3_id').attr({id: `item_images_attributes_2_id`,name: `item[images_attributes][2][id]`});

            $('#item_images_attributes_4_image').attr({id: `item_images_attributes_3_image`,name: `item[images_attributes][3][image]`});
            $('input[name="item[images_attributes][4][_destroy]"]').attr({name: `item[images_attributes][3][_destroy]`});
            $('#item_images_attributes_4__destroy').attr({id: `item_images_attributes_3__destroy`,name: `item[images_attributes][3][_destroy]`});
            $('#item_images_attributes_4_id').attr({id: `item_images_attributes_3_id`,name: `item[images_attributes][3][id]`});

            $('.hidden-content input:last').attr({id: `item_images_attributes_4_image`,name: `item[images_attributes][4][image]`});

            if ($('.hidden-content input').eq(-2).attr('id').match(/2/)){
              $('.hidden-content input').eq(-2).attr({id: `item_images_attributes_4_id`,name: `item[images_attributes][4][id]`});
            }

            if ($('.hidden-content input').eq(-3).attr('id').match(/2/)){
              $('.hidden-content input').eq(-3).attr({id: `item_images_attributes_4__destroy`,name: `item[images_attributes][4][_destroy]`});
            }

            if ($('.hidden-content input').eq(-4).attr('name').match(/2/)){
              $('.hidden-content input').eq(-4).attr({name: `item[images_attributes][4][_destroy]`});
            } 

            $('#preview-box__3').attr({id: `preview-box__2`});
            $('#previmage__3').attr({id: `previmage__2`});
            $('#update_btn_3').attr({id: `update_btn_2`});
            $('#destroy_btn_3').attr({id: `destroy_btn_2`});

            $('#preview-box__4').attr({id: `preview-box__3`});
            $('#previmage__4').attr({id: `previmage__3`});
            $('#update_btn_4').attr({id: `update_btn_3`});
            $('#destroy_btn_4').attr({id: `destroy_btn_3`});
            
          }else if(id == 3){

            $('input[name="item[images_attributes][3][_destroy]"]').appendTo('.hidden-content')
            $('#item_images_attributes_3__destroy').appendTo('.hidden-content')
            $('#item_images_attributes_3_id').appendTo('.hidden-content')
            $('#item_images_attributes_3_image').appendTo('.hidden-content')


            $('#item_images_attributes_4_image').attr({id: `item_images_attributes_3_image`,name: `item[images_attributes][3][image]`});
            $('input[name="item[images_attributes][4][_destroy]"]').attr({name: `item[images_attributes][3][_destroy]`});
            $('#item_images_attributes_4__destroy').attr({id: `item_images_attributes_3__destroy`,name: `item[images_attributes][3][_destroy]`});
            $('#item_images_attributes_4_id').attr({id: `item_images_attributes_3_id`,name: `item[images_attributes][3][id]`});

            $('.hidden-content input:last').attr({id: `item_images_attributes_4_image`,name: `item[images_attributes][4][image]`});

            if ($('.hidden-content input').eq(-2).attr('id').match(/3/)){
              $('.hidden-content input').eq(-2).attr({id: `item_images_attributes_4_id`,name: `item[images_attributes][4][id]`});
            }

            if ($('.hidden-content input').eq(-3).attr('id').match(/3/)){
              $('.hidden-content input').eq(-3).attr({id: `item_images_attributes_4__destroy`,name: `item[images_attributes][4][_destroy]`});
            }

            if ($('.hidden-content input').eq(-4).attr('name').match(/3/)){
              $('.hidden-content input').eq(-4).attr({name: `item[images_attributes][4][_destroy]`});
            } 

            $('#preview-box__4').attr({id: `preview-box__3`});
            $('#previmage__4').attr({id: `previmage__3`});
            $('#update_btn_4').attr({id: `update_btn_3`});
            $('#destroy_btn_4').attr({id: `destroy_btn_3`});

          }else{

          }

          var count = $('.preview-box').length;

          if (count > 5){
            $(`#item_images_attributes_6_image`).val("");
            $('.label-box').attr({id: `label-box--${count}`,for: `item_images_attributes_${count}_image`});
          }

          if (count == 4) {
            $('.label-content').show();
            $('.drop').hide();
          }
          setLabel(count);
          if(id < 5){
            $('.label-box').attr({id: `label-box--${count}`,for: `item_images_attributes_${count}_image`});
          }

          if(count == 0){
            $('.drop').show();
          }

        } else {
          $(`#item_images_attributes_${id}__destroy`).prop('checked',true);

          if(id == 0){

            $('input[name="item[images_attributes][0][_destroy]"]').appendTo('.hidden-content')
            $('#item_images_attributes_0__destroy').appendTo('.hidden-content')
            $('#item_images_attributes_0_id').appendTo('.hidden-content')
            $('#item_images_attributes_0_image').appendTo('.hidden-content')



            $('#item_images_attributes_1_image').attr({id: `item_images_attributes_0_image`,name: `item[images_attributes][0][image]`});
            $('input[name="item[images_attributes][1][_destroy]"]').attr({name: `item[images_attributes][0][_destroy]`});
            $('#item_images_attributes_1__destroy').attr({id: `item_images_attributes_0__destroy`,name: `item[images_attributes][0][_destroy]`});
            $('#item_images_attributes_1_id').attr({id: `item_images_attributes_0_id`,name: `item[images_attributes][0][id]`});

            $('#item_images_attributes_2_image').attr({id: `item_images_attributes_1_image`,name: `item[images_attributes][1][image]`});
            $('input[name="item[images_attributes][2][_destroy]"]').attr({name: `item[images_attributes][1][_destroy]`});
            $('#item_images_attributes_2__destroy').attr({id: `item_images_attributes_1__destroy`,name: `item[images_attributes][1][_destroy]`});
            $('#item_images_attributes_2_id').attr({id: `item_images_attributes_1_id`,name: `item[images_attributes][1][id]`});

            $('#item_images_attributes_3_image').attr({id: `item_images_attributes_2_image`,name: `item[images_attributes][2][image]`});
            $('input[name="item[images_attributes][3][_destroy]"]').attr({name: `item[images_attributes][2][_destroy]`});
            $('#item_images_attributes_3__destroy').attr({id: `item_images_attributes_2__destroy`,name: `item[images_attributes][2][_destroy]`});
            $('#item_images_attributes_3_id').attr({id: `item_images_attributes_2_id`,name: `item[images_attributes][2][id]`});

            $('#item_images_attributes_4_image').attr({id: `item_images_attributes_3_image`,name: `item[images_attributes][3][image]`});
            $('input[name="item[images_attributes][4][_destroy]"]').attr({name: `item[images_attributes][3][_destroy]`});
            $('#item_images_attributes_4__destroy').attr({id: `item_images_attributes_3__destroy`,name: `item[images_attributes][3][_destroy]`});
            $('#item_images_attributes_4_id').attr({id: `item_images_attributes_3_id`,name: `item[images_attributes][3][id]`});



            $('.hidden-content input:last').attr({id: `item_images_attributes_4_image`,name: `item[images_attributes][4][image]`});

            if ($('.hidden-content input').eq(-2).attr('id').match(/0/)){
              $('.hidden-content input').eq(-2).attr({id: `item_images_attributes_4_id`,name: `item[images_attributes][4][id]`});
            }

            if ($('.hidden-content input').eq(-3).attr('id').match(/0/)){
              $('.hidden-content input').eq(-3).attr({id: `item_images_attributes_4__destroy`,name: `item[images_attributes][4][_destroy]`});
            }

            if ($('.hidden-content input').eq(-4).attr('name').match(/0/)){
              $('.hidden-content input').eq(-4).attr({name: `item[images_attributes][4][_destroy]`});
            } 



            $('#preview-box__1').attr({id: `preview-box__0`});
            $('#previmage__1').attr({id: `previmage__0`});
            $('#update_btn_1').attr({id: `update_btn_0`});
            $('#destroy_btn_1').attr({id: `destroy_btn_0`});

            $('#preview-box__2').attr({id: `preview-box__1`});
            $('#previmage__2').attr({id: `previmage__1`});
            $('#update_btn_2').attr({id: `update_btn_1`});
            $('#destroy_btn_2').attr({id: `destroy_btn_1`});

            $('#preview-box__3').attr({id: `preview-box__2`});
            $('#previmage__3').attr({id: `previmage__2`});
            $('#update_btn_3').attr({id: `update_btn_2`});
            $('#destroy_btn_3').attr({id: `destroy_btn_2`});

            $('#preview-box__4').attr({id: `preview-box__3`});
            $('#previmage__4').attr({id: `previmage__3`});
            $('#update_btn_4').attr({id: `update_btn_3`});
            $('#destroy_btn_4').attr({id: `destroy_btn_3`});

          }else if(id == 1){

            $('input[name="item[images_attributes][1][_destroy]"]').appendTo('.hidden-content')
            $('#item_images_attributes_1__destroy').appendTo('.hidden-content')
            $('#item_images_attributes_1_id').appendTo('.hidden-content')
            $('#item_images_attributes_1_image').appendTo('.hidden-content')



            $('#item_images_attributes_2_image').attr({id: `item_images_attributes_1_image`,name: `item[images_attributes][1][image]`});
            $('input[name="item[images_attributes][2][_destroy]"]').attr({name: `item[images_attributes][1][_destroy]`});
            $('#item_images_attributes_2__destroy').attr({id: `item_images_attributes_1__destroy`,name: `item[images_attributes][1][_destroy]`});
            $('#item_images_attributes_2_id').attr({id: `item_images_attributes_1_id`,name: `item[images_attributes][1][id]`});

            $('#item_images_attributes_3_image').attr({id: `item_images_attributes_2_image`,name: `item[images_attributes][2][image]`});
            $('input[name="item[images_attributes][3][_destroy]"]').attr({name: `item[images_attributes][2][_destroy]`});
            $('#item_images_attributes_3__destroy').attr({id: `item_images_attributes_2__destroy`,name: `item[images_attributes][2][_destroy]`});
            $('#item_images_attributes_3_id').attr({id: `item_images_attributes_2_id`,name: `item[images_attributes][2][id]`});

            $('#item_images_attributes_4_image').attr({id: `item_images_attributes_3_image`,name: `item[images_attributes][3][image]`});
            $('input[name="item[images_attributes][4][_destroy]"]').attr({name: `item[images_attributes][3][_destroy]`});
            $('#item_images_attributes_4__destroy').attr({id: `item_images_attributes_3__destroy`,name: `item[images_attributes][3][_destroy]`});
            $('#item_images_attributes_4_id').attr({id: `item_images_attributes_3_id`,name: `item[images_attributes][3][id]`});

            
            $('.hidden-content input:last').attr({id: `item_images_attributes_4_image`,name: `item[images_attributes][4][image]`});

            if ($('.hidden-content input').eq(-2).attr('id').match(/1/)){
              $('.hidden-content input').eq(-2).attr({id: `item_images_attributes_4_id`,name: `item[images_attributes][4][id]`});
            }

            if ($('.hidden-content input').eq(-3).attr('id').match(/1/)){
              $('.hidden-content input').eq(-3).attr({id: `item_images_attributes_4__destroy`,name: `item[images_attributes][4][_destroy]`});
            }

            if ($('.hidden-content input').eq(-4).attr('name').match(/1/)){
              $('.hidden-content input').eq(-4).attr({name: `item[images_attributes][4][_destroy]`});
            } 


            $('#preview-box__2').attr({id: `preview-box__1`});
            $('#previmage__2').attr({id: `previmage__1`});
            $('#update_btn_2').attr({id: `update_btn_1`});
            $('#destroy_btn_2').attr({id: `destroy_btn_1`});

            $('#preview-box__3').attr({id: `preview-box__2`});
            $('#previmage__3').attr({id: `previmage__2`});
            $('#update_btn_3').attr({id: `update_btn_2`});
            $('#destroy_btn_3').attr({id: `destroy_btn_2`});

            $('#preview-box__4').attr({id: `preview-box__3`});
            $('#previmage__4').attr({id: `previmage__3`});
            $('#update_btn_4').attr({id: `update_btn_3`});
            $('#destroy_btn_4').attr({id: `destroy_btn_3`});

          }else if(id == 2){

            $('input[name="item[images_attributes][2][_destroy]"]').appendTo('.hidden-content')
            $('#item_images_attributes_2__destroy').appendTo('.hidden-content')
            $('#item_images_attributes_2_id').appendTo('.hidden-content')
            $('#item_images_attributes_2_image').appendTo('.hidden-content')


            $('#item_images_attributes_3_image').attr({id: `item_images_attributes_2_image`,name: `item[images_attributes][2][image]`});
            $('input[name="item[images_attributes][3][_destroy]"]').attr({name: `item[images_attributes][2][_destroy]`});
            $('#item_images_attributes_3__destroy').attr({id: `item_images_attributes_2__destroy`,name: `item[images_attributes][2][_destroy]`});
            $('#item_images_attributes_3_id').attr({id: `item_images_attributes_2_id`,name: `item[images_attributes][2][id]`});

            $('#item_images_attributes_4_image').attr({id: `item_images_attributes_3_image`,name: `item[images_attributes][3][image]`});
            $('input[name="item[images_attributes][4][_destroy]"]').attr({name: `item[images_attributes][3][_destroy]`});
            $('#item_images_attributes_4__destroy').attr({id: `item_images_attributes_3__destroy`,name: `item[images_attributes][3][_destroy]`});
            $('#item_images_attributes_4_id').attr({id: `item_images_attributes_3_id`,name: `item[images_attributes][3][id]`});

            $('.hidden-content input:last').attr({id: `item_images_attributes_4_image`,name: `item[images_attributes][4][image]`});

            if ($('.hidden-content input').eq(-2).attr('id').match(/2/)){
              $('.hidden-content input').eq(-2).attr({id: `item_images_attributes_4_id`,name: `item[images_attributes][4][id]`});
            }

            if ($('.hidden-content input').eq(-3).attr('id').match(/2/)){
              $('.hidden-content input').eq(-3).attr({id: `item_images_attributes_4__destroy`,name: `item[images_attributes][4][_destroy]`});
            }

            if ($('.hidden-content input').eq(-4).attr('name').match(/2/)){
              $('.hidden-content input').eq(-4).attr({name: `item[images_attributes][4][_destroy]`});
            } 

            $('#preview-box__3').attr({id: `preview-box__2`});
            $('#previmage__3').attr({id: `previmage__2`});
            $('#update_btn_3').attr({id: `update_btn_2`});
            $('#destroy_btn_3').attr({id: `destroy_btn_2`});

            $('#preview-box__4').attr({id: `preview-box__3`});
            $('#previmage__4').attr({id: `previmage__3`});
            $('#update_btn_4').attr({id: `update_btn_3`});
            $('#destroy_btn_4').attr({id: `destroy_btn_3`});
            
          }else if(id == 3){

            $('input[name="item[images_attributes][3][_destroy]"]').appendTo('.hidden-content')
            $('#item_images_attributes_3__destroy').appendTo('.hidden-content')
            $('#item_images_attributes_3_id').appendTo('.hidden-content')
            $('#item_images_attributes_3_image').appendTo('.hidden-content')


            $('#item_images_attributes_4_image').attr({id: `item_images_attributes_3_image`,name: `item[images_attributes][3][image]`});
            $('input[name="item[images_attributes][4][_destroy]"]').attr({name: `item[images_attributes][3][_destroy]`});
            $('#item_images_attributes_4__destroy').attr({id: `item_images_attributes_3__destroy`,name: `item[images_attributes][3][_destroy]`});
            $('#item_images_attributes_4_id').attr({id: `item_images_attributes_3_id`,name: `item[images_attributes][3][id]`});

            $('.hidden-content input:last').attr({id: `item_images_attributes_4_image`,name: `item[images_attributes][4][image]`});

            if ($('.hidden-content input').eq(-2).attr('id').match(/3/)){
              $('.hidden-content input').eq(-2).attr({id: `item_images_attributes_4_id`,name: `item[images_attributes][4][id]`});
            }

            if ($('.hidden-content input').eq(-3).attr('id').match(/3/)){
              $('.hidden-content input').eq(-3).attr({id: `item_images_attributes_4__destroy`,name: `item[images_attributes][4][_destroy]`});
            }

            if ($('.hidden-content input').eq(-4).attr('name').match(/3/)){
              $('.hidden-content input').eq(-4).attr({name: `item[images_attributes][4][_destroy]`});
            } 

            $('#preview-box__4').attr({id: `preview-box__3`});
            $('#previmage__4').attr({id: `previmage__3`});
            $('#update_btn_4').attr({id: `update_btn_3`});
            $('#destroy_btn_4').attr({id: `destroy_btn_3`});
            
          }else{

          }

          var count = $('.preview-box').length;

          if (count > 5){
            $(`#item_images_attributes_6_image`).val("");
            $('.label-box').attr({id: `label-box--${count}`,for: `item_images_attributes_${count}_image`});
          }

          if (count == 4) {
            $('.label-content').show();
            $('.drop').hide();
          }

          if(count == 0){
            $('.drop').show();
          }

          setLabel();

          if(id < 5){
            $('.label-box').attr({id: `label-box--${count}`,for: `item_images_attributes_${count}_image`});
          }
        }
      });
    }
  });
});