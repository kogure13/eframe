
$(document).ready(function() {
  $('#btn_add_val').html('add user');
  
  $('#btn_add').on('click', function(e) {
    e.preventDefault();
    
        $('#add_model').modal({backdrop: 'static', keyboard: false});
        $('#modal_title').html('Add new user');
        $('#action').val('add');
        $('#edit_id').val(0);
    
  });
  
  $('#btn_cancel').click(function () {
        var $form = $('#form_model');
        $form.trigger('reset');
        $form.validate().resetForm();
        $form.find('.error').removeClass('error');
  });
  
  $('#form_model').validate({
      rules: {
        username: {
          required: true,
          minLength: 4
        },
        password: {},
        role: {}
      },
      messages: {},
      submitHandler: function(form) {
        var com_action = $('#action').val();
            if (com_action == 'add') {
                ajaxAction('add');
            } else if (com_action == 'edit') {
                ajaxAction('edit');
            }

            $('#form_model').trigger('reset');
      }      
  });  
  
  var dataTable = $('#lookup').dataTable({
      'bLengthChange': false
  });
  
  
});

function ajaxAction(action) {
  var data = $('#form_model').serializeArray();
  var dataTable = $('#lookup').dataTable();
  var url = 'application/user/ajax.php';
  
  
  var v_dump = $.ajax({
    url: url,
    type: 'post',
    dataType: 'json',
    data: data,
    success: function() {
      
    },
    error: function() {}
  });
  
  console.log(v_dump)
}
