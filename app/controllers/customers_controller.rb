class CustomersController < InheritedResources::Base
  authorize_resource

  def create
    create! { collection_path }
  end
end
