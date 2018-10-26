$(document).ready(function () {
  $('#btn_add_dist_val').html('Tambah Distribusi');
  $('#btn_upload_dist_val').html('Upload Distribusi');

  $('#btn_add_distribusi, #btn_upload_dist').on('click', function () {
    var id = $(this).attr('id');
    if (id == 'btn_add_distribusi') {
      $('.table-distribusi').slideUp(500);
      $('.add-disposisi-form').show(100);
    } else if (id == 'btn_upload_dist') {
      $('.table-distribusi').slideUp(500);
      $('.add-disposisi-upload').show(100);
    }
  });

  $('.btn-cancel').on('click', function () {
    var id_btn = $(this).attr('id');
    var form_name = $(this).attr('form-name');

    if (id_btn == 'btn_cancel_iaudit') {
      $('.add-disposisi-form').hide(500);
      $('.table-distribusi').show(500);
    } else if (id_btn == 'btn_cancel_uaudit') {
      $('.add-disposisi-upload').hide(500);
      $('.table-distribusi').show(500);
    }

    var $form = $('#' + form_name);
    $form.trigger('reset');
    $form.validate().resetForm();
    $form.find('.error').removeClass('error');
    window.location.reload();
  });

  var current_date = new Date();
  $('.tanggal').datepicker("setDate", current_date);
  
  if ($('#active_user').val() == 1) {
    $('#lookupTerkirim').DataTable({
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
        url: 'application/distribusi/ajax.php?data=terkirim',
        error: function () {
          $.Notification.notify(
                  'error', 'top center',
                  'Warning',
                  'Data tidak tersedia'
                  );
        }
      },
      fnDrawCallback: function (oSettings) {

        $('#lookupTerkirim td.sifat').each(function () {
          var sifat = $(this).html();
          switch (sifat) {
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

            $('#action_iaudit').val('edit');
            $('#edit_id_iaudit').val(id);

            v_edit = $.ajax({
              url: 'application/distribusi/edit.php?id=' + id + '&tb_name=distribusi',
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

          } else if (com === 'Delete') {
            var conf = confirm('Delete this items ?');
            var url = 'application/distribusi/data.php';

            if (conf) {
              $.post(url, {id: id, action: com.toLowerCase()}, function () {
                var table = $('#lookup').DataTable();
                table.ajax.reload();
              });
            }
          }
        });
      }
    });
  } else if ($('#active_user').val() == 2) {
    $('#lookupTerima').DataTable({
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
        url: 'application/distribusi/ajax.php?data=terima',
        error: function () {
          $.Notification.notify(
                  'error', 'top center',
                  'Warning',
                  'Data tidak tersedia'
                  );
        }
      },
      fnDrawCallback: function (oSettings) {

        $('#lookupTerima td.sifat').each(function () {
          var sifat = $(this).html();
          switch (sifat) {
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

            $('#action_iaudit').val('edit');
            $('#edit_id_iaudit').val(id);

            v_edit = $.ajax({
              url: 'application/distribusi/edit.php?id=' + id + '&tb_name=distribusi',
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

          } else if (com === 'Delete') {
            var conf = confirm('Delete this items ?');
            var url = 'application/distribusi/data.php';

            if (conf) {
              $.post(url, {id: id, action: com.toLowerCase()}, function () {
                var table = $('#lookup').DataTable();
                table.ajax.reload();
              });
            }
          } else if(com === 'Detail') {
            var url = '?page=distribusi&read=active&id='+id;
            window.location.href = url;            
          }
        });
      }
    });//end datatable distribusi diterima
  }

  $('#form_iaudit').validate({
    rules: {
      sifat: {
        required: true
      },
      noagenda: {
        required: true
      },
      tglagenda: {
        required: true
      },
      perihal: {
        required: true
      },
      notugas: {
        required: true
      },
      tgltugas: {
        required: true
      },
      asal: {
        required: true
      },
      pesan: {
        required: true
      },
      'idkelompok[]': {
        required: true,
        minlength: 1
      }
    },
    messages: {
      sifat: {
        required: "*) Please choose one"
      },
      noagenda: {
        required: "*) Field is required"
      },
      tglagenda: {
        required: "*) Field is required"
      },
      perihal: {
        required: "*) Field is required"
      },
      notugas: {
        required: "*) Field is required"
      },
      tgltugas: {
        required: "*) Field is required"
      },
      asal: {
        required: "*) Field is required"
      },
      pesan: {
        required: "*) Field is required"
      },
      'idkelompok[]': {
        required: 'at least 1 kelompok must checked',
        minlength: 1
      }
    },
    errorPlacement: function (error, element) {
      if (element.attr("name") == "idkelompok[]")
        error.insertAfter("#errPeran");
      else
        error.insertAfter(element)
    },
    submitHandler: function (form) {
      var com_form = '';
      var com_action = $('#action_iaudit').val();
      if (com_action == 'iadd') {
        com_form = 'iaudit';
        ajaxAction('iadd', com_form);
      } else if (com_action == 'iedit') {
        com_form = 'uaudit';
        ajaxAction('iedit', com_form);
      }

      $('#form_' + com_form).trigger('reset');
    }
  });//end validate iaudit

});

function ajaxAction(action, form) {
  data = $('#form_' + form).serializeArray();

  var v_ajax = $.ajax({
    url: 'application/distribusi/data.php',
    type: 'post',
    data: data,
    success: function (response) {
      console.log(response)
    },
    error: function (jqXHR, textStatus, errorThrown) {
      console.log(textStatus)
    }
  });

  console.log(data)
}