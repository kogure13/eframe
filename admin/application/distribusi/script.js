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
  });

  var current_date = new Date();
  $('.tanggal').datepicker("setDate", current_date);

  $('#lookupDownload').DataTable();
  $('#lookupTerima').DataTable();
  $('#lookupTerkirim').DataTable();
  $('#lookupUpload').DataTable();

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
    submitHandler: function(form) {
      var com_form = '';
      var com_action = $('#action').val();
      if (com_action == 'add') {
        com_form = 'iaudit';
        ajaxAction('iadd', com_form);
      } else if (com_action == 'edit') {
        com_form = 'uaudit';
        ajaxAction('edit', com_form);
      }

      $('#form_'+com_form).trigger('reset');
    }
  });

  $('#form_uaudit').validate({
    rules: {
      pengirim: {
        required: true
      },
      namafile: {
        required: true
      },
      'idkelompok[]': {
        required: true,
        minlength: 1
      }
    },
    messages: {
      pengirim: {
        required: '*) field is required'
      },
      namafile: {
        required: '*) field is required'
      },
      'idkelompok[]': {
        required: 'at least 1 kelompok must checked',
        minlength: 1
      }
    },
    errorPlacement: function (error, element) {
      if (element.attr("name") == "idkelompok[]")
        error.insertAfter("#errPeranU");
      else
        error.insertAfter(element)
    }
  });
  
});

function ajaxAction(action, form) {
  data = $('#form_'+form).serializeArray();
  
  var v_ajax = $.ajax({
    url: 'application/distribusi/data.php',
    type: 'post',
    dataType: 'json',
    success: function (data, textStatus, jqXHR) {
      $('#testArea').html(data);
    }
  });
  
  console.log(v_ajax)
}