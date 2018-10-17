$(document).ready(function () {
  
  $('#btn_add_val').html('add pengumuman');

  $('#btn_add').on('click', function (e) {
    e.preventDefault();

    $('#add_model').modal({backdrop: 'static', keyboard: false});
    $('#modal_title').html('Add new pengumuman');
    $('#action').val('add');
    $('#edit_id').val(0);

  });

  $('#btn_cancel').click(function () {
    var $form = $('#form_model');
    $form.trigger('reset');
    $form.validate().resetForm();
    $form.find('.error').removeClass('error');
  });
  
  var dataTable = $('#lookup').dataTable({
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
      url: 'application/pengumuman/ajax.php',
      error: function () {
        $.Notification.notify(
                'error', 'top center',
                'Warning',
                'Data tidak tersedia'
                );
      }
    },
    fnDrawCallback: function (oSettings) {      

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
          $('.modal-title').html('Edit pengumuman');
          $('#action').val('edit');
          $('#edit_id').val(id);
          tb_name = 'master_pengumuman';

          v_edit = $.ajax({
            url: 'application/data/edit.php?id=' + id + '&tb_name=' + tb_name,
            type: 'GET',
            dataType: 'JSON',
            success: function (data) {
              $('#judul').val(data.judul);
              $('#textPengumuman').val(data.pengumuman);              
            }
          });

        } else if (com == 'Delete') {
          var conf = confirm('Delete this items ?');
          var url = 'application/pengumuman/data.php';

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
  
  if ($("#textPengumuman").length > 0) {
    tinymce.init({
      selector: "textarea#textPengumuman",
      theme: "modern",
      height: 300,
      plugins: [
        "advlist autolink link image lists charmap print preview hr anchor pagebreak spellchecker",
        "searchreplace wordcount visualblocks visualchars code fullscreen insertdatetime media nonbreaking",
        "save table contextmenu directionality emoticons template paste textcolor"
      ],
      toolbar: "insertfile undo redo | styleselect | bold italic | alignleft aligncenter alignright alignjustify | bullist numlist outdent indent | l      ink image | print preview media fullpage | forecolor backcolor emoticons",
      style_formats: [
        {title: 'Bold text', inline: 'b'},
        {title: 'Red text', inline: 'span', styles: {color: '#ff0000'}},
        {title: 'Red header', block: 'h1', styles: {color: '#ff0000'}},
        {title: 'Example 1', inline: 'span', classes: 'example1'},
        {title: 'Example 2', inline: 'span', classes: 'example2'},
        {title: 'Table styles'},
        {title: 'Table row 1', selector: 'tr', classes: 'tablerow1'}
      ]
    });
  }
});