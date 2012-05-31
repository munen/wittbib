class Lending < ActiveRecord::Base

  belongs_to :book
  belongs_to :customer

  scope :not_available, where(:returned_at => nil)

end
