class Book < ActiveRecord::Base
  attr_accessible :author, :title, :isbn, :description
end
