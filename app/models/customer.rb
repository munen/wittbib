class Customer < ActiveRecord::Base
  attr_accessible :name, :street, :phone, :email, :district, :is_library_visitor

  validates_presence_of :name
end
