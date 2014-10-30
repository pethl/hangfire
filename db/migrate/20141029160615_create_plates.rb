class CreatePlates < ActiveRecord::Migration
  def change
    create_table :plates do |t|
      t.decimal :price
      t.string :name
      t.integer :category_id

      t.timestamps
    end
  end
end
