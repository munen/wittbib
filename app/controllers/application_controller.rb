class ApplicationController < ActionController::Base
  protect_from_forgery

  # Global authorization lockdown
  check_authorization :unless => :devise_controller?

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_url, :alert => exception.message
  end

  layout proc {|c| c.request.format == 'application/html' && c.request.xhr? ? false : "application" }

end
