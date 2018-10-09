
$(document).ready(function() {  
  
  $('#btn_add_val').html('Hasil Audit');
  $('#btn_add').on('click', function() {
    $('.haudit-table').slideUp(500);
    $('.haudit-form').show(1500);
  });
  
  $('#btn_cancel').on('click', function() {
    $('.haudit-table').slideDown(500);
    $('.haudit-form').hide(500);
  });
  
  $('#jsGridHaudit').jsGrid({
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
        name: "kode",
        type: "text",
        width: 90,
        validate: "required"
      },
      {
        name: "Masalah",
        type: "text",
        width: 150,
        validate: "required"
      },
      {
        name: "Kriteria",
        type: "text",
        width: 150,
        validate: "required"
      },
      {
        name: "Sebab",
        type: "text",
        width: 150,
        validate: "required"
      },
      {
        name: "Akibat",
        type: "text",
        width: 150,
        validate: "required"
      },
      {
        name: "Rekomendasi",
        type: "text",
        width: 150,
        validate: "required"
      },
      {
        type: "control"
      }
    ]
  });
  
  var dataTable = $('#lookup').dataTable();
});