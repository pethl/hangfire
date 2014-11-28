class CreateEventplanners < ActiveRecord::Migration
  def change
    create_table :eventplanners do |t|
      t.string :name
      t.integer :category_id

      t.timestamps
    end
  end
end
