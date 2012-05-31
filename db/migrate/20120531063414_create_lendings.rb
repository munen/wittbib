class CreateLendings < ActiveRecord::Migration
  def change
    create_table :lendings do |t|
      t.integer :book_id
      t.integer :customer_id
      t.datetime :taken_at
      t.datetime :returned_at

      t.timestamps
    end
  end
end
