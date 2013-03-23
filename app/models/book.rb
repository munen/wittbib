class Book < ActiveRecord::Base

  has_many :lendings, :dependent => :destroy

  attr_accessor :isbn
  attr_accessible :authors, :title, :isbn, :isbn_10, :isbn_13,
                  :description, :language, :page_count,
                  :published_date, :publisher, :image_url,
                  :deleted_at

  default_scope where(:deleted_at => nil)

  scope :lent, joins(:lendings).where('lendings.returned_at' => nil)

  def isbn
    @isbn || isbn_13 || isbn_10
  end

  def state
    lendings.not_available.any? ? t('not_available') : t('available')
  end

  # Generates CSV
  def self.csv(search_params = nil)
    csv = "Autoren, Titel, ISBN, Sprache, Seitenzahl, Veroeffentlichung, Verlag\n"
    Book.all.each do |e|
      csv << e.to_csv
    end
    csv
  end

  def to_csv
    require 'csv'
    CSV.generate do |csv|
      csv << [self.authors, self.title, self.isbn, self.language,
              self.page_count, self.published_date, self.publisher]
    end
  end

  def mark_as_deleted
    self.deleted_at = Time.now
    self.save
  end

end
