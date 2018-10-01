$(document).ready(function() {
  $('#btn_add_dist_val').html('Tambah Distribusi');
  $('#btn_upload_dist_val').html('Upload Distribusi');
  
  $('#btn_add_distribusi').on('click', function() {
    $('.table-distribusi').slideUp(500);
    $('.add-disposisi-form').show(1500);
  });
  
  $('#btn_cancel').on('click', function() {
    $('.haudit-table').slideDown(500);
    $('.haudit-form').hide(500);
  });
});