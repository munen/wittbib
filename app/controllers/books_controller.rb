class BooksController < InheritedResources::Base

  respond_to :html, :datatables

  def new
    resource = Book.new(params[:book])
    new!
  end


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

  def query
    isbn = normalize_isbn(params[:isbn])
    length = isbn.length
    raise 'unknown isbn format' unless %w(10 13).include?(length.to_s)
    @collection = Book.send("find_all_by_isbn_#{length}", isbn)
    if @collection.count==1
      @resource = @collection.first 
      render :action => 'show'
    else
      render :action => 'index'
    end
  end

  private
  
  def normalize_isbn(isbn)
    isbn.tr_s('- ','')
  end

end
