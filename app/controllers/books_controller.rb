class BooksController < InheritedResources::Base

  def new
    resource = Book.new(params[:book])
    new!
  end

  def create
    create! { collection_path }
  end

end
