$(document).ready(function() {
  $('#btn_add_dist_val').html('Tambah Distribusi');
  $('#btn_upload_dist_val').html('Upload Distribusi');
  
  $('#btn_add_distribusi, #btn_upload_dist').on('click', function() {
    var id = $(this).attr('id');
    if(id == 'btn_add_distribusi'){
      $('.table-distribusi').slideUp(500);
      $('.add-disposisi-form').show(100);
    }else if(id == 'btn_upload_dist') {
      $('.table-distribusi').slideUp(500);
      $('.add-disposisi-upload').show(100);
    }    
  });

  $('#btn_cancel').on('click', function() {
    $('.haudit-table').slideDown(500);
    $('.haudit-form').hide(500);
  });
});