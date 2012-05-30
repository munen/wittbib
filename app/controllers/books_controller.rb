class BooksController < InheritedResources::Base

  def create
    create! { collection_path }
  end

end
