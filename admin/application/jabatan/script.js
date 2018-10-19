
$(document).ready(function () {
  $('#btn_add_val').html('add jabatan');

  $('#btn_add').on('click', function (e) {
    e.preventDefault();

    $('#add_model').modal({backdrop: 'static', keyboard: false});
    $('#modal_title').html('Add new jabatan');
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
      jabatan: {
        required: true,
        minlength: 4
      }
    },
    messages: {
      jabatan: {
        required: '*) field is required'
      }
    },
    submitHandler: function (form) {
      var com_action = $('#action').val();
      if (com_action == 'add') {
        ajaxAction('add');
      } else if (com_action == 'edit') {
        ajaxAction('edit');
      }

      $('#form_model').trigger('reset');
    }
  });

  var dataTable = $('#lookup').DataTable({
    'bLengthChange': false,
    'autoWidth': false,
    'aoColumnDefs': [
      {'bSortable': false, 'aTargets': ['nosort']}
    ],
    'processing': true,
    'serverSide': true,
    'ajax': {
      type: 'POST',
      dataType: 'JSON',
      url: 'application/jabatan/ajax.php',
      error: function () {
        $.Notification.notify(
                'error', 'top center',
                'Warning',
                'Data tidak tersedia'
                );
      }
    },
    fnDrawCallback: function (oSettings) {

      $('#lookup td.status').each(function () {
        var status = $(this).html();
        switch (status) {
          case 'Inactive':
            $(this).addClass('status-inactive');
            break;
          case 'Active':
            $(this).addClass('status-active');
            break;
          default:
            return;
        }
      });

      $('.act_btn').each(function () {
        $(this).tooltip({
          html: true
        });
      });

      $('.act_btn').on('click', function (e) {
        e.preventDefault();
        var com = $(this).attr('data-original-title');
        var id = $(this).attr('id');

        if (com == 'Edit') {
          $('#add_model').modal({backdrop: 'static', keyboard: false});
          $('.modal-title').html('Edit jabatan');
          $('#action').val('edit');
          $('#edit_id').val(id);
          tb_name = 'master_jabatan';

          v_edit = $.ajax({
            url: 'application/jabatan/edit.php?id=' + id + '&tb_name=' + tb_name,
            type: 'POST',
            dataType: 'JSON',
            success: function (data) {
              $('#jabatan').val(data.jabatan);
            }
          });

        } else if (com == 'Delete') {
          var conf = confirm('Delete this items ?');
          var url = 'application/jabatan/data.php';

          if (conf) {
            $.post(url, {id: id, action: com.toLowerCase()}, function () {
              var table = $('#lookup').DataTable();
              table.ajax.reload();
            });
          }
        }
      });
    }
  });//end datatable 
});

function ajaxAction(action) {
  data = $('#form_model').serializeArray();
  url = 'application/jabatan/data.php';
  var table = $('#lookup').DataTable();

  var v_dump = $.ajax({
    url: url,
    type: 'post',
    dataType: 'json',
    data: data,
    success: function (response) {
      if (response == 1) {
        alert('Data sudah tersedia');
      } else if (response == 0) {
        $('#add_model').modal('hide');
        table.ajax.reload();
      }
    }
  });
}
