class Api::BooksController < ApplicationController
  authorize_resource

  def search
    bs = BookSearch.new
    bs.search(params[:isbn])
    render :json => bs
  end

end
