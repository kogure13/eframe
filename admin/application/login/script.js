$(document).ready(function() {
  
  $('#login').validate({
    rules: {
      username: {
        required: true
      },
      password: {
        required: true,
      }
    },
    messages: {
      username: {
        required: '*) field is required'
      },
      password: {
        required: '*) field is required'
      }
    },
    submitHandler: function (form) {
      ajaxAction();

      $('#login').trigger('reset');
    }
  });
});

function ajaxAction() {
  
}