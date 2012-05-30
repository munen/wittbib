class BooksController < InheritedResources::Base

  respond_to :html, :datatables


  def create
    create! { collection_path }
  end


  # GET /books/search
  def search
    @books = Book.search(params[:search]).
      paginate(:page => params[:page],
               :per_page=>params[:per_page])
    respond_with @books
  end

end
