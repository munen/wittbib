class Book < ActiveRecord::Base
  attr_accessor :isbn
  attr_accessible :authors, :title, :isbn, :isbn_10, :isbn_13,
                  :description, :language, :page_count,
                  :published_date, :publisher, :image_url

  def isbn
    @isbn || isbn_13 || isbn_10
  end

end
