class Book < ActiveRecord::Base
  attr_accessible :author, :title, :isbn, :description

  validates_presence_of :author, :title
end
