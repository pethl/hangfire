class CreateEventproducts < ActiveRecord::Migration
  def change
    create_table :eventproducts do |t|
      t.integer :eventplanner_id
      t.integer :product_id
      t.integer :covers
      t.decimal :over_ride_price

      t.timestamps
    end
  end
end
