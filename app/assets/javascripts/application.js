// This is a manifest file that'll be compiled into including all the files listed below.
// Add new JavaScript/Coffee code in separate files in this directory and they'll automatically
// be included in the compiled file accessible from http://example.com/assets/application.js
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
//= require jquery
//= require jquery_ujs

// Include twitter bootstraps's javascripts
//= require bootstrap

//= require isbn
//= require books

//= require_tree .

$(function() {

  $(document).bind('keyup', function(e) {
    if(event.keyCode==27) { // ESC
      $('#query').focus().val('');
    }
  });

  $('#query').keyup(function(event) {
    var feedback = $('#feedback');
    var query = event.srcElement.value;
    feedback.removeClass('success').addClass('warning');
    if(query=='') {
      feedback.removeClass('warning');
    }
    if(validateISBN(query)) {
      feedback.addClass('success');
      console.log(query); // TODO
      $.ajax('/books/new?book[isbn]='+query, {
        success: function(data, textStatus, jqXHR) {
          $('#content').html('').append(data);
        }
      });
    }
    // match regex for user id
    // match regex for location id
  });

  $(".form-search input[type='submit']").hide();

});
