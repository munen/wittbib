$ ->
  $('#query').change((event) ->
    console.log(event)
  )

  $("#books").dataTable({
      "sAjaxSource"     : "/books/search.datatables",
      "aaSorting"       : [[0, 'asc']],
      "aoColumns"       : [
        {"sName":"author"},
        {"sName":"title"},
        {"sName":"isbn"},
        {"sName":"description"},
      ],
      "bServerSide"     : true,
      "fnServerData"    : simpleDatatables,
      "sPaginationType": "full_numbers"
    });
