$ ->

  #$("#lendings").dataTable({
  #    "aoColumnDefs": [
  #       { 'bSortable': false, 'aTargets': [ -1 ] },
  #       { 'sWidth': '40px', 'aTargets': [ -1, ] }
  #     ],
  #    "aaSorting"       : [[0, 'asc']],
  #    "sPaginationType": "full_numbers",
  #    "sPaginationType": "bootstrap",
  #    "oLanguage": {
  #      "sProcessing":   "Bitte warten...",
  #      "sLengthMenu":   "_MENU_ Einträge anzeigen",
  #      "sZeroRecords":  "Keine Einträge vorhanden.",
  #      "sInfo":         "_START_ bis _END_ von _TOTAL_ Einträgen",
  #      "sInfoEmpty":    "0 bis 0 von 0 Einträgen",
  #      "sInfoFiltered": "(gefiltert von _MAX_  Einträgen)",
  #      "sInfoPostFix":  "",
  #      "sSearch":       "Suchen",
  #      "sUrl":          "",
  #      "oPaginate": {
  #          "sFirst":    "Erste Seite",
  #          "sPrevious": "Zurück",
  #          "sNext":     "Nächster",
  #          "sLast":     "Letzte Seite"
  #      }
  #    },
  #    "fnServerData"    : simpleDatatables,
  #  });
