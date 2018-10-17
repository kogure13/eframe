$(document).ready(function () {

  $.ajax({
    url: 'application/sambutan/data.php',
    type: 'post',
    dataType: 'json',
    success: function (data, textStatus, jqXHR) {
      $('#textSambutan').val(data.kata);
    }
  });

  $('#form_model').validate({
    submitHandler: function () {
      var com_action = $('#action').val();
      if (com_action == 'add') {
        ajaxAction('add');
      }
    }
  });

//  var contentTiny = tinymce.activeEditor.getContent();
//  console.log(tinyMCE.activeEditor.getContent())

  if ($("#textSambutan").length > 0) {
    tinymce.init({
      selector: "textarea#textSambutan",
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
      ],
      setup: function(editor) {
        editor.on('change', function() {
          editor.save();
        });
      }
    });
  }
});

function ajaxAction(action) {
  data = $('#form_model').serializeArray();

  v_dump = $.ajax({
    url: 'application/sambutan/data.php',
    type: 'post',
    dataType: 'json',
    data: data,
    success: function (response) {
      if (response == 1) {
        location.reload();
      }
    }
  });
  console.log(data)
}