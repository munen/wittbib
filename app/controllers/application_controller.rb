class ApplicationController < ActionController::Base
  protect_from_forgery

  layout proc {|c| c.request.format == 'application/html' && c.request.xhr? ? false : "application" }

end
