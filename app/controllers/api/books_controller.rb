class Api::BooksController < ApplicationController
  def search
    render :json => GoogleBooks.search("isbn:#{params[:isbn]}").first
  end
end
