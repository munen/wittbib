class BooksController < InheritedResources::Base

  respond_to :html, :datatables

  def new
    new!
  end

  #def create
    #create! { :notice => t('book_created', :delete_link => 'asdf') }
    #link_to t('delete_book'), , :method => :delete) }
  #end

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
    @books = Book.send("find_all_by_isbn_#{length}", isbn)
    if @books.count==1
      @book = @books.first 
      render :action => 'show', :layout => false
    elsif @books.count > 1
      render :js => "window.location = '/books?isbn=#{isbn}'"
    else
      @book = Book.new(:isbn => isbn)
      render :action => 'new', :layout => false
    end
  end

  private
  
  def normalize_isbn(isbn)
    isbn.tr_s('- ','')
  end

end
