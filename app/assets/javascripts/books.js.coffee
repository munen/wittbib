$ ->

  $("#books").dataTable({
      "sAjaxSource"     : "/books/search.datatables",
      "aaSorting"       : [[0, 'asc']],
      "aoColumns"       : [
        {"sName":"authors"},
        {"sName":"title"},
        {"sName":""},
        {"sName":""},
        {"sName":"description"},
      ],
      "bServerSide"     : true,
      "sPaginationType": "full_numbers",
      "sPaginationType": "bootstrap",
      "fnServerData"    : simpleDatatables
    });
