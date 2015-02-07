$(document).ready(function() {
  $('.edit').on("click", function(){
    $('.edit_form').hide();
    $(this).parent().find('.edit_form').show();
  });

  $('.add').on("click", function(){
    $('.add_form').hide();
    $(this).parent().find('.add_form').show();
  });

  // $('.edit_form').submit(function(event){
  //   event.preventDefault()
  // })

// 1. What am I sending to the server?
// 2. What am I doing with that information and what am I sending back?
// 3. Now that I got a response, what am I doing to the view
});
