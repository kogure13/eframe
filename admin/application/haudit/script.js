
$(document).ready(function() {  
  
  $('#btn_add_val').html('Hasil Audit');
  $('#btn_add').on('click', function() {
    $('.haudit-table').slideUp(500);
    $('.haudit-form').show(1500);
  });
  
  $('#btn_cancel').on('click', function() {
    $('.haudit-table').slideDown(500);
    $('.haudit-form').hide(500);
  });
  
  var dataTable = $('#lookup').dataTable();
});