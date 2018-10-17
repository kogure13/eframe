$(document).ready(function(){
  var aText = $('#text').val();
  var q = $('#q').val();
  
  v_dump = $.ajax({
    url: 'application/read/data.php?aText='+aText+'&q='+q,
    type: 'post',
    dataType: 'json',
    success: function (data) {
      $('.page-title').html(data.judul);
      $('.page-title-alt').html(data.tgl);
      $('.isi').append(data.content);
      console.log(data.content); 
    }
  });
  
});