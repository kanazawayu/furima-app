$(document).on('turbolinks:load', function(){
  $(function(){


    function appendOption(num){
      var html = `<option value="${num}">${num}</option>`;
      return html;
    }

    function appenddays(insertHTML){
      var childSelectHtml = '';
      childSelectHtml = `<select class="select-field" name="user[profile_attributes][birth_day]" id="user_profile_attributes_birth_day">
                           <option value="">---</option>
                           ${insertHTML}
                         <select>`;
      $('.user__input__birth').append(childSelectHtml);
    }

    $('#user_profile_attributes_birth_month').on("change", function(){

      var a = $('#user_profile_attributes_birth_month').val();
      if(a == "monthone" || a == "monththree" || a == "monthfive" || a == "monthseven" || a == "montheight" || a == "mounthten" || a == "monthtwelve"){

      }else if(a == "monthtwo"){

        $("#user_profile_attributes_birth_day").remove();

        days = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29]
        var insertHTML = '';
        days.forEach(function(day){
          insertHTML += appendOption(day);
        });
        appenddays(insertHTML);

      }else{

        $("#user_profile_attributes_birth_day").remove();

        days = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30]
        var insertHTML = '';
        days.forEach(function(day){
          insertHTML += appendOption(day);
        });
        appenddays(insertHTML);

      }
    })
  });
});