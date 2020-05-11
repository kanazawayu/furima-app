// $(document).on('turbolinks:load', function(){
//   $(function(){

//     function appendOption(category){
//       var html = `<li class="dropdown-child__menu" id="menu">${category.name}</li>`;
//       return html;
//     }

//     function appendChidrenBox(insertHTML){
//       var childSelectHtml = '';
//       childSelectHtml = `<ul class="dropdown-child">
//                           ${insertHTML}
//                         </ul>`;
//       $('.center__topic__items__category').append(childSelectHtml);
//     }

//     function appendGrandchidrenBox(insertHTML){
//       var grandchildSelectHtml = '';
//       grandchildSelectHtml = `<ul class="dropdown-grangchild">
//                                 ${insertHTML}
//                               </ul>`;
//       $('.center__topic__items__category').append(grandchildSelectHtml);
//     }

//     $('.center__topic__items__category').hover(
//       function() {
//         $('.dropdown').css('display', 'none');
//         $('.dropdown-child').remove();
//         $('.dropdown-grangchild').remove();
//         $('.dropdown').css('display', 'unset');
//       }, function() {
        
//       }
//     )

//     $('.dropdown__menu').hover(
//       function() {
//         var parentCategory = $(this).text().replace(/\r?\n/g,"");
//         $.ajax({
//           url: '/items/get_category_children',
//           type: 'GET',
//           data: { parent_name: parentCategory },
//           dataType: 'json'
//         })
//         .done(function(children){
//           var insertHTML = '';
//           var num = children.length
//           var height = num*39
//           children.forEach(function(child){
//             insertHTML += appendOption(child);
//           });
//           $('.dropdown-child').remove();
//           $('.dropdown-grangchild').remove();
//           appendChidrenBox(insertHTML);
//           $('.dropdown-child').css('height', height);
//         })
//         .fail(function(){
//           alert('カテゴリー取得に失敗しました');
//         })
//       }, function() {
//         // $('.dropdown').css('display', 'none');
//         // $('.dropdown-child').remove();
//         // $('.dropdown-grangchild').remove();
//       }
//     )

//     $(document).on({
//       'mouseenter' : function() {

//         $('.dropdown').css('display', 'unset');
//         var childCategory = $(this).text().replace(/\r?\n/g,"");
//         $.ajax({
//           url: '/items/set',
//           type: 'GET',
//           data: { child_name: childCategory },
//           dataType: 'json'
//         })
//         .done(function(grandchildren){
//           var insertHTML = '';
//           var num = grandchildren.length
//           var height = num*39
//           grandchildren.forEach(function(child){
//             insertHTML += appendOption(child);
//           });
//           $('.dropdown-grangchild').remove();
//           appendGrandchidrenBox(insertHTML);
//           $('.dropdown-grangchild').css('height', height);
//         })
//         .fail(function(){
//           alert('カテゴリー取得に失敗しました');
//         })

//       },
//       'mouseleave' : function(){
        
//         // $('.dropdown').css('display', 'none');
//         // $('.dropdown-child').remove();
//         // $('.dropdown-grangchild').remove();

//       }
//       }, '.dropdown-child__menu');

//       $('.dropdown').hover(
//         function() {

//         }, function() {
//           $('.dropdown').css('display', 'none');
//           // $('.dropdown-child').remove();
//           // $('.dropdown-grandchild').hide();
//         }
//       )

//       $(document).on({
//         'mouseenter' : function() {
  
//         },
//         'mouseleave' : function(){
          
//           // $('.dropdown').css('display', 'none');
//           // $('.dropdown-child').remove();

//         }
//         }, '.dropdown-child');

//       // $('.dropdown-child').hover(
//       //   function() {
//       //     $('.dropdown').css('display', 'unset');
//       //   }, function() {
          
//       //   }
//       // )
    

    
//     // $('.select__category').on('change', '#child_category', function(){
//     //   var childId = $('#child_category').val(); 
//     //   if (childId != "選択してください"){
//     //     $.ajax({
//     //       url: '/items/get_category_grandchildren',
//     //       type: 'GET',
//     //       data: { child_id: childId },
//     //       dataType: 'json'
//     //     })
//     //     .done(function(grandchildren){
//     //       if (grandchildren.length != 0) {
//     //         $('#grandchildren_wrapper').remove();
//     //         var insertHTML = '';
//     //         grandchildren.forEach(function(grandchild){
//     //           insertHTML += appendOption(grandchild);
//     //         });
//     //         appendGrandchidrenBox(insertHTML);
//     //         $('#parent_category').removeAttr('name');
//     //         $('#child_category').removeAttr('name');
//     //       }
//     //     })
//     //     .fail(function(){
//     //       alert('カテゴリー取得に失敗しました');
//     //     })
//     //   }else{
//     //     $('#grandchildren_wrapper').remove();
//     //   }
//     });

//   });
