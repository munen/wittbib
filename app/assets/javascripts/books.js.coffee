$ ->
  $("#books").dataTable({
      "sAjaxSource"     : "/books/search.datatables",
      "aaSorting"       : [[0, 'asc']],
      "aoColumns"       : [
        {"sName":"authors"},
        {"sName":"title"},
        {"sName":"isbn_13"},
        {"sName":"description"},
      ],
      "bServerSide"     : true,
      "fnServerData"    : simpleDatatables
    });
