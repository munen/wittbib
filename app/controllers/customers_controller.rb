class CustomersController < InheritedResources::Base

  def create
    create! { collection_path }
  end
end
