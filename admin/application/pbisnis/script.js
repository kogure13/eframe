$(document).ready(function() {
  $('#btn_add_val').html('Upload SOP');
  $('#btn_add').on('click', function(e) {
    e.preventDefault();

    $('#add_model').modal({backdrop: 'static', keyboard: false});
    $('#modal_title').html('SOP FORM');
    $('#action').val('add');
    $('#edit_id').val(0);
  });
  
  
  $('#lookup').DataTable();
});