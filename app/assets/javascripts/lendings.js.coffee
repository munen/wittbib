$ ->

  $("#lendings").dataTable({
      "sPaginationType": "bootstrap",
      "oLanguage": {
        "sProcessing":   "Bitte warten...",
        "sLengthMenu":   "_MENU_ Einträge anzeigen",
        "sZeroRecords":  "Keine Einträge vorhanden.",
        "sInfo":         "_START_ bis _END_ von _TOTAL_ Einträgen",
        "sInfoEmpty":    "0 bis 0 von 0 Einträgen",
        "sInfoFiltered": "(gefiltert von _MAX_  Einträgen)",
        "sInfoPostFix":  "",
        "sSearch":       "Suchen",
        "sUrl":          "",
        "oPaginate": {
            "sFirst":    "Erste Seite",
            "sPrevious": "Zurück",
            "sNext":     "Nächster",
            "sLast":     "Letzte Seite"
        }
      }
  })
