class AddArchivedToBooks < ActiveRecord::Migration
  def change
    add_column :books, :archived, :boolean, :default => false

    Book.all.each do |b|
      b.update_attribute :archived, false
    end
  end
end
