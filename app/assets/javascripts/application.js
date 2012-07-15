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
//= require bootstrap_pagination

//= require isbn
//= require books
//= require simple_datatables

//= require chosen-jquery
//= require init_chosen

//= require_tree .

$(function() {

  $(document).bind('keyup', function(e) {
    if(event.keyCode==27) { // ESC
      $('#query').focus().val('');
    }
  });

  $('#query').keyup(function(event) {
    var feedback = $('#feedback');
    var query = $(this).val();
    feedback.removeClass('success').addClass('warning');
    if(query=='') {
      feedback.removeClass('warning');
    }
    if(validateISBN(query)) {
      feedback.removeClass('warning').addClass('success');
      queryBooksInternally(query);
    }
    // match regex for user id
    // match regex for location id
  });

  $(".form-search input[type='submit']").hide();
  $('#progress').hide();

  // for testing
  // $('#query').val('3150094976').keyup();

  function queryBooksInternally(isbn) {
    console.log(' query books internally ');
    $('#progress').show();
    $.ajax('/books/query?isbn='+isbn, {
      success: function(data, textStatus, jqXHR) {
        $('#content').html('').append(data);
        $('#progress').hide();
        if($('#new_book').length > 0) { queryGoogle(isbn); };
      }
    });
  }

  function queryGoogle(isbn) {
    $('#progress').show();
    $.ajax('/api/books/'+isbn, {
      error: function(data) {
        alert('Error: '+data);
      },
      success: function(data) {
        console.log(data);
        if (data) {
          var keys = ['authors', 'title', 'description', 'isbn_10',
                      'isbn_13', 'language', 'page_count',
                      'published_date', 'publisher'];
          $(keys).each(function(index, key) {
            $('#book_'+key).val(data[key]);
          });
          try { $('#book_image_url').val(data.item.volumeInfo.imageLinks.thumbnail); }
          catch(e) {}; // ignore
          $('#progress').hide();
          $("#new_book button[type='submit']").click();
        } else {
          // no book metadata could be found
          $("#progress").hide();
          // only show notice once
          if(!$("#feedback p").length) {
            $("#feedback").append("<p>Keine Buchmetadaten gefunden</p>");
            setTimeout(function() {
              $("#feedback p").remove();
            }, 5000);
          }

        }
      }
    });
  }

});
