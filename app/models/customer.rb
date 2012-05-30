class Customer < ActiveRecord::Base
  attr_accessible :name, :street, :phone, :email, :district, :is_library_visitor
end
