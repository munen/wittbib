class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
      t.string :authors
      t.string :title
      t.string :isbn_10
      t.string :isbn_13
      t.text :description
      t.string :language
      t.string :page_count
      t.string :published_date
      t.string :publisher

      t.timestamps
    end
  end
end
