class Customer < ActiveRecord::Base

  has_many :lendings

  attr_accessible :name, :street, :phone, :email, :district, :is_library_visitor

  validates_presence_of :name
end
