class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.string :meat
      t.text :desc

      t.timestamps
    end
  end
end
