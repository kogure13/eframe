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

  $('.btn-cancel').on('click', function() {
    var id_btn = $(this).attr('id');
    var form_name = $(this).attr('form-name');
    
    if(id_btn == 'btn_cancel_iaudit') {
      $('.add-disposisi-form').hide(500);
      $('.table-distribusi').show(500);
    } else if(id_btn == 'btn_cancel_uaudit') {
      $('.add-disposisi-upload').hide(500);
      $('.table-distribusi').show(500);
    }
    
    var $form = $('#'+form_name);
    $form.trigger('reset');
    $form.validate().resetForm();
    $form.find('.error').removeClass('error');
  });
  
  $('#lookupDownload').DataTable();
  $('#lookupTerima').DataTable();
  $('#lookupTerkirim').DataTable();
  $('#lookupUpload').DataTable();

});