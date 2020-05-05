$(document).on('turbolinks:load', function(){
  $(function(){

    function appendOption(category){
      var html = `<option value="${category.id}" data-category="${category.id}">${category.name}</option>`;
      return html;
    }

    function appendChidrenBox(insertHTML){
      var childSelectHtml = '';
      childSelectHtml = `<div class='select__category__box__added' id= 'children_wrapper'>
                          <select class="select__category__box--Form" id="child_category" name="item[category_id]">
                            <option value="選択してください" data-category="---">選択してくだい</option>
                            ${insertHTML}
                          <select>
                        </div>`;
      $('.select__category').append(childSelectHtml);
    }

    function appendGrandchidrenBox(insertHTML){
      var grandchildSelectHtml = '';
      grandchildSelectHtml = `<div class='select__category__box__added' id= 'grandchildren_wrapper'>
                                <select class="select__category__box--form" id="grandchild_category" name="item[category_id]">
                                  <option value="選択してください" data-category="---">選択してください</option>
                                  ${insertHTML}
                                </select>
                              </div>`;
      $('.select__category').append(grandchildSelectHtml);
    }

    $('#parent_category').on('change', function(){
      var parentCategory = document.getElementById('parent_category').value;
      if (parentCategory != "選択してください"){ 
        $.ajax({
          url: '/items/get_category_children',
          type: 'GET',
          data: { parent_name: parentCategory },
          dataType: 'json'
        })
        .done(function(children){
          $('#children_wrapper').remove();
          $('#grandchildren_wrapper').remove();
          var insertHTML = '';
          children.forEach(function(child){
            insertHTML += appendOption(child);
          });
          appendChidrenBox(insertHTML);
          $('#parent_category').removeAttr('name');
        })
        .fail(function(){
          alert('カテゴリー取得に失敗しました');
        })
      }else{
        $('#children_wrapper').remove(); 
        $('#grandchildren_wrapper').remove();
      }
    });
    
    $('.select__category').on('change', '#child_category', function(){
      var childId = $('#child_category').val(); 
      if (childId != "選択してください"){
        $.ajax({
          url: '/items/get_category_grandchildren',
          type: 'GET',
          data: { child_id: childId },
          dataType: 'json'
        })
        .done(function(grandchildren){
          if (grandchildren.length != 0) {
            $('#grandchildren_wrapper').remove();
            var insertHTML = '';
            grandchildren.forEach(function(grandchild){
              insertHTML += appendOption(grandchild);
            });
            appendGrandchidrenBox(insertHTML);
            $('#parent_category').removeAttr('name');
            $('#child_category').removeAttr('name');
          }
        })
        .fail(function(){
          alert('カテゴリー取得に失敗しました');
        })
      }else{
        $('#grandchildren_wrapper').remove();
      }
    });
  });
});