class AddDeletedAtToBooks < ActiveRecord::Migration
  def change
    add_column :books, :deleted_at, :datetime

  end
end
