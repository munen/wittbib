class BooksController < InheritedResources::Base

  respond_to :html, :datatables

  def new
    new!
  end

  def index
    respond_to do |format|
      format.html

      format.csv do
        send_data(Book.csv,
                  :type => 'text/csv; charset=iso-8859-1; header=present',
                  :filename => "book_catalogue_#{Date.today}.csv")
      end
    end
  end

  def destroy
    book = Book.find(params[:id])
    book.mark_as_deleted
    flash[:notice] = 'Buch erfolgreich archiviert'
    redirect_to books_path
  end

  #def create
  #create! { :notice => t('book_created', :delete_link => 'asdf') }
  #link_to t('delete_book'), , :method => :delete) }
  #end

  # GET /books/search
  def search

    # datatables sends a search request like param1_or_param2_sw
    # '_sw' stands for 'starts with'. but since we want to have a full text
    # search, here a _contains is injected to induce a 'like' query.
    #
    # params is a frozen hash in rails. this is a workaround.
    params_search = params[:search].dup
    if params_search.keys.any? { |k| k.match(/_sw/) }

      # get the key which contains the query
      t_key = params_search.keys.reject { |k| !k.include? "_sw" }.first

      # delete _sw key and inject _contains key
      val = params_search.delete t_key
      key = t_key.gsub("_sw", "_contains")
      params_search[key] = val
    end
    params[:search] = params_search

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

  #def collection
  #  Book.includes(:lendings).collect { |b| b if !b.lendings.empty? }.compact
  #end

  private

  def normalize_isbn(isbn)
    isbn.tr_s('- ','')
  end


end
