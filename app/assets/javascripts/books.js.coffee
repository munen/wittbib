$ ->

  $("#books").dataTable({
      "sAjaxSource"     : "/books/search.datatables",
      "aaSorting"       : [[0, 'asc']],
      "aoColumns"       : [
        {"sName":"authors"},
        {"sName":"title"},
        {"sName":"isbn_10"},
        {"sName":"isbn_13"},
        {"sName":"show", bSearchable:false,},
        {"sName":"description"},
      ],
      "bServerSide"     : true,
      "sPaginationType": "full_numbers",
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
      },
      "fnServerData"    : simpleDatatables
    });
