class ActiveRecord::Base

  def t(*args)
    I18n.t(*args)
  end

end
