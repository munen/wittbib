class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :authenticate_user!

  layout proc {|c| c.request.format == 'application/html' && c.request.xhr? ? false : "application" }

end
