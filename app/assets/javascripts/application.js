//= require jquery
//= require jquery_ujs
//= require foundation
//= require video
//= require_tree .

$(function(){ $(document).foundation();

    setTimeout(function(){
      $('.notice').fadeOut();
    }, 3500);

});

$('#upload-load').hide();
$('.tuts-submit').on('click', function(){
  $(this).hide();
  $('#upload-load').show();
});
