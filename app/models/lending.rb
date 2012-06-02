class Lending < ActiveRecord::Base

  belongs_to :book
  belongs_to :customer

  attr_accessible :book_id, :customer_id

  validates :book_id, :customer_id,
    :presence => true

  scope :not_available, where(:returned_at => nil)

end
