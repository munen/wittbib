class ArchivesController < ApplicationController
  before_filter :authorize

  def authorize
    authorize!(params[:action], Book)
  end

end
