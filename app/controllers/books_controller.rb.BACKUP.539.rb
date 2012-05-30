class BooksController < InheritedResources::Base

<<<<<<< HEAD
  respond_to :html, :datatables

=======
  def new
    resource = Book.new(params[:book])
    new!
  end
>>>>>>> 36da6ea075810b513218f544b084c5772d3d42ca

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
