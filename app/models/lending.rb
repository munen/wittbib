class Lending < ActiveRecord::Base

  belongs_to :book
  belongs_to :customer

  attr_accessible :book_id, :customer_id

  validates :book_id, :customer_id, :taken_at,
    :presence => true

  scope :not_available, where(:returned_at => nil)

  def is_overdue?
    taken_at < 4.weeks.ago
  end

end
