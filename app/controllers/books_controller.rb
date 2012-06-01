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

    # datatables sends a search request like param1_or_param2_sw
    # '_sw' stands for 'starts with'. but since we want to have a full text
    # search, here a _contains is injected to induce a 'like' query.
    if params[:search].keys.join(" ") =~ /_sw/
      # params is a frozen hash in rails. this is a workaround.
      params[:search] = params[:search].dup

      # get the key which contains the query
      t_key = params[:search].keys.reject { |k| !k.include? "_sw" }.first
      val = params[:search][t_key]

      # delete _sw key and inject _contains key
      params[:search].delete t_key
      key = t_key.gsub("_sw", "_contains")
      params[:search][key] = val
      params[:search].freeze
    end

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
