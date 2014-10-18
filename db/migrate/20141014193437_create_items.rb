class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.decimal :price
      t.integer :weight
      t.string :size
      t.integer :product_id
      t.integer :quantity

      t.timestamps
    end
  end
end
