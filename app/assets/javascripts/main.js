$(document).ready(function(){

  $('.nav li').on('click', function(e){
    // e.preventDefault(); leave out because we want these li's to do what they're supposed to
    $(this).addClass('active');
    $(this).parent().children('li').not(this).removeClass('active');
    // e.stopPropagation(); check what this does before we use it
  });

  $(document).click(function(e){
    // e.preventDefault();
    $('.nav li').removeClass('active');
  });
  // ^^ change this later

});
