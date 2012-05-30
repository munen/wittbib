class CreateCustomers < ActiveRecord::Migration
  def change
    create_table :customers do |t|
      t.string :name
      t.string :street
      t.string :phone
      t.string :district
      t.string :email
      t.boolean :is_library_visitor

      t.timestamps
    end
  end
end
