
$(document).ready(function() {

  var id = $('#pkompetensi').attr('data-id');
  //get information employee
  $.ajax({
    url: 'application/kompetensi/data.php?id='+id,
    type: 'post',
    dataType: 'json',
    success: function(data) {
      $('#pkompetensi').html(data.nama);
    }
  });

  $('#pkompetensi').attr('style', 'cursor: pointer');
  $('#pkompetensi').on('click', function() {

  });

  $('#grid_table1').jsGrid({
    width: "100%",
    height: "auto",

    filtering: true,
    inserting: true,
    editing: true,
    sorting: true,
    paging: true,
    autoload: true,
    pageSize: 10,
    pageButtonCount: 5,
    deleteConfirm: "Yakin hapus data ini ?",

    fields: [
      {
        name: "id",
        type: "hidden",
        css: "hide"
      },
      {
        name: "Nama",
        type: "text",
        width: 150,
        validate: "required"
      },
      {
        name: "Penyelenggara",
        type: "text",
        width: 150,
        validate: "required"
      },
      {
        name: "Tahun",
        type: "text",
        width: 150,
        validate: "required"
      },
      {
        type: "control"
      }
    ]
  });//grid table1

  $('#grid_table2').jsGrid({
    width: "100%",
    height: "auto",

    filtering: true,
    inserting: true,
    editing: true,
    sorting: true,
    paging: true,
    autoload: true,
    pageSize: 10,
    pageButtonCount: 5,
    deleteConfirm: "Yakin hapus data ini ?",

    fields: [
      {
        name: "id",
        type: "hidden",
        css: "hide"
      },
      {
        name: "Topik",
        type: "text",
        width: 150,
        validate: "required"
      },
      {
        name: "Penyelenggara",
        type: "text",
        width: 150,
        validate: "required"
      },
      {
        name: "Tahun",
        type: "text",
        width: 150,
        validate: "required"
      },
      {
        type: "control"
      }
    ]
  });//grid table2

  $('#grid_table3').jsGrid({
    width: "100%",
    height: "auto",

    filtering: true,
    inserting: true,
    editing: true,
    sorting: true,
    paging: true,
    autoload: true,
    pageSize: 10,
    pageButtonCount: 5,
    deleteConfirm: "Yakin hapus data ini ?",

    fields: [
      {
        name: "id",
        type: "hidden",
        css: "hide"
      },
      {
        name: "Topik",
        type: "text",
        width: 150,
        validate: "required"
      },
      {
        name: "Penyelenggara",
        type: "text",
        width: 150,
        validate: "required"
      },
      {
        name: "Tahun",
        type: "text",
        width: 150,
        validate: "required"
      },
      {
        type: "control"
      }
    ]
  });//grid table3
});
