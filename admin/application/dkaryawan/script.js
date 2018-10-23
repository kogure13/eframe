
$(document).ready(function () {
  $('#btn_add_val').html('add karyawan');

  $('#btn_add').on('click', function (e) {
    e.preventDefault();

    $('#add_model').modal({backdrop: 'static', keyboard: false});
    $('#modal_title').html('Add new karyawan');
    $('#action').val('add');
    $('#edit_id').val(0);

  });

  $('#btn_cancel').click(function () {
    var $form = $('#form_model');
    $form.trigger('reset');
    $form.validate().resetForm();
    $form.find('.error').removeClass('error');
  });

  var items_golongan = '';
  var items_jabatan = '';
  var items_peran = '';

  $.ajax({
    url: 'application/jabatan/option_jabatan.php',
    type: 'post',
    dataType: 'json',
    success: function (data, textStatus, jqXHR) {
      $.each(data, function (key, value) {
        items_jabatan += '<option value="' + value.id + '">' + value.jabatan + '</option>';
      });

      $('#jabatan').append(items_jabatan);
    }
  });

  $.ajax({
    url: 'application/golongan/option_golongan.php',
    type: 'post',
    dataType: 'json',
    success: function (data, textStatus, jqXHR) {
      $.each(data, function (key, value) {
        items_golongan += '<option value="' + value.id + '">' + value.golongan + '</option>';
      });

      $('#golongan').append(items_golongan);
    }
  });

  $.ajax({
    url: 'application/peran/option_peran.php',
    type: 'post',
    dataType: 'json',
    success: function (data, textStatus, jqXHR) {
      $.each(data, function (key, value) {
        items_peran += '<option value="' + value.id + '">' + value.peran + '</option>';
      });

      $('#peran').append(items_peran);
    }
  });

  $('#form_model').validate({
    rules: {
      nip: {
        required: true
      },
      nama: {
        required: true
      },
      jabatan: {
        required: true
      },
      golongan: {
        required: true
      },
      peran: {
        required: true
      }
    },
    messages: {
      nip: {
        required: '*) field is required'
      },
      nama: {
        required: '*) field is required'
      },
      golongan: {
        required: '*) choose one'
      },
      peran: {
        required: '*) choose one'
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
      url: 'application/dkaryawan/ajax.php',
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
          $('.modal-title').html('Edit karyawan');
          $('#action').val('edit');
          $('#edit_id').val(id);

          v_edit = $.ajax({
            url: 'application/dkaryawan/edit.php?id=' + id + '&tb_name=master_karyawan',
            type: 'POST',
            dataType: 'JSON',
            success: function (data) {
              $('#nip').val(data.nip);
              $('#nama').val(data.nama);
              $('#alamat').val(data.alamat);
              $('#tlp').val(data.tlp);
              $('#jabatan').val(data.id_jabatan);
              $('#golongan').val(data.id_golongan);
              $('#peran').val(data.id_peran);
            }
          });

        } else if (com == 'Delete') {
          var conf = confirm('Delete this items ?');
          var url = 'application/dkaryawan/data.php';

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
  url = 'application/dkaryawan/data.php';
  var table = $('#lookup').DataTable();

  var v_dump = $.ajax({
    url: url,
    type: 'post',
    dataType: 'json',
    data: data,
    success: function (response) {
      if (response == 0) {
        alert('data berhasil diupdate');
        $('#add_model').modal('hide');
        table.ajax.reload();
      } else if(response == 1) {
        alert('data sudah tersedia');
      }      
    }
  });
}
