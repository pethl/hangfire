class CreateOrderitems < ActiveRecord::Migration
  def change
    create_table :orderitems do |t|
      t.integer :order_id
      t.integer :saleproduct_id
      t.integer :quantity
      t.decimal :item_price
      t.decimal :total_price

      t.timestamps
    end
  end
end
