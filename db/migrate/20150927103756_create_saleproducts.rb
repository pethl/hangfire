class CreateSaleproducts < ActiveRecord::Migration
  def change
    create_table :saleproducts do |t|
      t.string :name
      t.integer :stock_quantity
      t.integer :remaining_quanity
      t.decimal :price, :precision => 16, :scale => 2
      t.string :weight
      t.integer :category_id

      t.timestamps
    end
  end
end
