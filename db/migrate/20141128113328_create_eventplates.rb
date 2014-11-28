class CreateEventplates < ActiveRecord::Migration
  def change
    create_table :eventplates do |t|
      t.integer :eventplanner_id
      t.integer :plate_id
      t.integer :covers
      t.decimal :over_ride_price

      t.timestamps
    end
  end
end
