$(document).ready(function() {

  $('#back').on('click', function() {
    window.location.href = "../../index.php";
  });

  $('#login').validate({
    rules: {
      username: {
        required: true
      },
      password: {
        required: true
      }
    },
    messages: {
      username: {
        required: '*) Username cannot be empty'
      },
      password: {
        required: '*) Password cannot be empty'
      }
    },
    submitHandler: function (form) {
      ajaxAction();

      $('#login').trigger('reset');
    }
  });

});


function ajaxAction() {
  data = $('#login').serializeArray();

  v_dump = $.ajax({
    data: data,
    url: '../../application/login/data.php',
    type: 'post',
    dataType: 'json',
    success: function(response) {
      if(response == 404) {
        alert('User tidak terdaftar');
      } else if (response == 0) {
        alert('username atau password salah!');
      } else if (response == 1) {
        window.location.href = "../../index.php";
      }
    },
    error: function(response) {
      alert('Malfunction system');
    }
  });
}
