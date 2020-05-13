$(document).on('turbolinks:load', function(){
  $(function(){

    function appendOption(category){
      var html = `<option value="${category.id}">${category.name}</option>`;
      return html;
    }

    function appendChidrenBox(insertHTML){
      var childSelectHtml = '';
      childSelectHtml = `<select name="q[category_id_eq]" id="q_category_id_eq" class="childcategory">
                           <option value="指定なし">指定なし</option>
                           ${insertHTML}
                         <select>`;
      $('.side__category').append(childSelectHtml);
    }

    function appendGrandchidrenBox(insertHTML){
      var grandchildSelectHtml = '';
      grandchildSelectHtml = `<select name="q[category_id_eq]" id="q_category_id_eq" class="grandchildcategory">
                                <option value="指定なし">指定なし</option>
                                ${insertHTML}
                              <select>`;
      $('.side__category').append(grandchildSelectHtml);
    }

    $('#q_category_id_eq').on('change', function(){
      var parentCategory = document.getElementById('q_category_id_eq').value;
      if (parentCategory != "指定なし"){ 
        $.ajax({
          url: '/items/get_category_children',
          type: 'GET',
          data: { parent_name: parentCategory },
          dataType: 'json'
        })
        .done(function(children){
          $('.childcategory').remove();
          $('.grandchildcategory').remove();
          var insertHTML = '';
          children.forEach(function(child){
            insertHTML += appendOption(child);
          });
          appendChidrenBox(insertHTML);
          $('.parentcategory').removeAttr('name');
        })
        .fail(function(){
          alert('カテゴリー取得に失敗しました');
        })
      }else{
        $('.childcategory').remove(); 
        $('.grandchildcategory').remove();
      }
    });
    
    $('.side__category').on('change', '.childcategory', function(){
      var childId = $('.childcategory').val(); 
      $('#q_category_id_eq').removeAttr('name');
      if (childId != "選択してください"){
        $.ajax({
          url: '/items/get_category_grandchildren',
          type: 'GET',
          data: { child_id: childId },
          dataType: 'json'
        })
        .done(function(grandchildren){
          if (grandchildren.length != 0) {
            $('.grandchildcategory').remove();
            var insertHTML = '';
            grandchildren.forEach(function(grandchild){
              insertHTML += appendOption(grandchild);
            });
            appendGrandchidrenBox(insertHTML);
            $('.childcategory').removeAttr('name');
          }
        })
        .fail(function(){
          alert('カテゴリー取得に失敗しました');
        })
      }else{
        $('.grandchildcategory').remove();
      }
    });
  });
});