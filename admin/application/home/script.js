$(document).ready(function () {
  var items_pengumuman = "";
  v_dump = $.ajax({
    url: 'application/home/data.php',
    type: 'post',
    dataType: 'json',
    success: function (data, textStatus, jqXHR) {
      $('#kata').html(data.kata);
      $.each(data.pengumuman, function (key, value) {
        items_pengumuman += '<li class="news-item">' + value.judul + ' <a href="#">read more...</a></li>';
      });
      $('#pengumuman').append(items_pengumuman);
    }
  });
  console.log(v_dump)

  $('.demo1').bootstrapNews({
    newsPerPage: 2,
    autoplay: true,
    pauseOnHover: true,
    direction: 'up',
    newsTickerInterval: 4000
  });
});
