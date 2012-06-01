module ApplicationHelper

  # output is a 'check' or 'cross' symbol
  def boolean_checkbox(condition)
    if condition
      "<i class='icon-ok'></i>".html_safe
    else
      "<i class='icon-remove'></i>".html_safe
    end
  end

end
