module BooksHelper
  # default book cover if none available
  def book_cover_picture
    if resource.image_url
      image_tag resource.image_url
    else
      image_tag "default_book_icon.jpeg"
    end
  end
end
