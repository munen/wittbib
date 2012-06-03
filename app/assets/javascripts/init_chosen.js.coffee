$ ->
  $('*[data-chosen]').each((index) ->
      no_results_text = $(this).attr("data-no-result-text")
      $(this).chosen({no_results_text: no_results_text })
   )
