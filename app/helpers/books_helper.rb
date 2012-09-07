module BooksHelper
  # default book cover if none available
  def book_cover_picture
    if resource.image_url.blank? or resource.image_url.nil?
      image_tag "default_book_icon.jpeg"
    else
      image_tag resource.image_url
    end
  end
end
