
$(document).ready(function() {
  
  $('#pkompetensi').attr('style', 'cursor: pointer');
  $('#pkompetensi').on('click', function() {
    alert($(this).attr('id'));
  });
});