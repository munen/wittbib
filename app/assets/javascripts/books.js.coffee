# encoding: UTF-8

$ ->

  $("#books").dataTable({
      "sAjaxSource"     : "/books/search.datatables",
      "aoColumnDefs": [
         { 'bSortable': false, 'aTargets': [ -1, -2, -3 ] },
         { 'sWidth': '40px', 'aTargets': [ -1, -2, -3 ] }
       ],

      "aaSorting"       : [[0, 'asc']],
      "aoColumns"       : [
        {"sName":"authors"},
        {"sName":"title"},
        {"sName":"isbn_10"},
        {"sName":"isbn_13"},
        {"sName":"show", bSearchable:false,},
        {"sName":"description"},
        {"sName":"archive", bSearchable:false},
        {"sName":"destroy", bSearchable:false}
      ],
      "bServerSide"     : true,
      "bRetrieve"       : true,
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
      "fnServerData"    : simpleDatatables,
      "sDom": 'T<"clear">lfrtip',
      "fnInitComplete" : ->
        # For anonymous login, do not show lend/edit/archive/destroy links
        if ($("#authorization").text().trim() == "anonymous")
          $('td:nth-last-child(5)').hide()
          $('td:nth-last-child(3)').hide()
          $('td:nth-last-child(2)').hide()
          $('td:nth-last-child(1)').hide()
    });

