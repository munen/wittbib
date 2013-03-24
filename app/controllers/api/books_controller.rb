class Api::BooksController < ApplicationController
  authorize_resource

  def search
    # adapting GoogleBooks requests to run better on Heroku
    user_ip = request.remote_ip
    render :json => GoogleBooks.search("isbn:#{params[:isbn]}", {}, user_ip).first
  end
end
