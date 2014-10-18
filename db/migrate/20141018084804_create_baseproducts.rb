class CreateBaseproducts < ActiveRecord::Migration
  def change
    create_table :baseproducts do |t|
      t.string :name
      t.date :purchase_date
      t.decimal :unit_weight
      t.decimal :total_weight
      t.decimal :unit_count
      t.decimal :total_price
      t.decimal :unit_price
      t.decimal :price_per

      t.timestamps
    end
  end
end
