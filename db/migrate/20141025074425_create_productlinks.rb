class CreateProductlinks < ActiveRecord::Migration
  def change
    create_table :productlinks do |t|
      t.integer :product_id
      t.integer :productchild_id

      t.timestamps
    end
  end
end
