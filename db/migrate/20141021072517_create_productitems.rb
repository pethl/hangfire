class CreateProductitems < ActiveRecord::Migration
  def change
    create_table :productitems do |t|
      t.integer :product_id
      t.integer :ingredient_id
      t.decimal :volume

      t.timestamps
    end
  end
end
