class Book < ActiveRecord::Base
  attr_accessor :isbn
  attr_accessible :authors, :title, :isbn, :isbn_10, :isbn_13,
                  :description, :language, :page_count,
                  :published_date, :publisher

  validates :isbn_10, :isbn_13, :uniqueness => true

end
