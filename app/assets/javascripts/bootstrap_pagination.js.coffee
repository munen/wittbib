$ ->
  $.fn.dataTableExt.oApi.fnPagingInfo = (oSettings) ->
    iStart: oSettings._iDisplayStart
    iEnd: oSettings.fnDisplayEnd()
    iLength: oSettings._iDisplayLength
    iTotal: oSettings.fnRecordsTotal()
    iFilteredTotal: oSettings.fnRecordsDisplay()
    iPage: Math.ceil(oSettings._iDisplayStart / oSettings._iDisplayLength)
    iTotalPages: Math.ceil(oSettings.fnRecordsDisplay() / oSettings._iDisplayLength)

  $.extend $.fn.dataTableExt.oPagination,
    bootstrap:
      fnInit: (oSettings, nPaging, fnDraw) ->
        oLang = oSettings.oLanguage.oPaginate
        fnClickHandler = (e) ->
          e.preventDefault()
          fnDraw oSettings  if oSettings.oApi._fnPageChange(oSettings, e.data.action)

        $(nPaging).addClass("pagination").append "<ul>" + "<li class=\"prev disabled\"><a href=\"#\">&larr; " + oLang.sPrevious + "</a></li>" + "<li class=\"next disabled\"><a href=\"#\">" + oLang.sNext + " &rarr; </a></li>" + "</ul>"
        els = $("a", nPaging)
        $(els[0]).bind "click.DT",
          action: "previous"
        , fnClickHandler
        $(els[1]).bind "click.DT",
          action: "next"
        , fnClickHandler

      fnUpdate: (oSettings, fnDraw) ->
        iListLength = 5
        oPaging = oSettings.oInstance.fnPagingInfo()
        an = oSettings.aanFeatures.p
        i = undefined
        j = undefined
        sClass = undefined
        iStart = undefined
        iEnd = undefined
        iHalf = Math.floor(iListLength / 2)
        if oPaging.iTotalPages < iListLength
          iStart = 1
          iEnd = oPaging.iTotalPages
        else if oPaging.iPage <= iHalf
          iStart = 1
          iEnd = iListLength
        else if oPaging.iPage >= (oPaging.iTotalPages - iHalf)
          iStart = oPaging.iTotalPages - iListLength + 1
          iEnd = oPaging.iTotalPages
        else
          iStart = oPaging.iPage - iHalf + 1
          iEnd = iStart + iListLength - 1
        i = 0
        iLen = an.length

        while i < iLen
          $("li:gt(0)", an[i]).filter(":not(:last)").remove()
          j = iStart
          while j <= iEnd
            sClass = (if (j is oPaging.iPage + 1) then "class=\"active\"" else "")
            $("<li " + sClass + "><a href=\"#\">" + j + "</a></li>").insertBefore($("li:last", an[i])[0]).bind "click", (e) ->
              e.preventDefault()
              oSettings._iDisplayStart = (parseInt($("a", this).text(), 10) - 1) * oPaging.iLength
              fnDraw oSettings
            j++
          if oPaging.iPage is 0
            $("li:first", an[i]).addClass "disabled"
          else
            $("li:first", an[i]).removeClass "disabled"
          if oPaging.iPage is oPaging.iTotalPages - 1
            $("li:last", an[i]).addClass "disabled"
          else
            $("li:last", an[i]).removeClass "disabled"
          i++
