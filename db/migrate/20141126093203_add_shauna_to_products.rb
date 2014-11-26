class AddShaunaToProducts < ActiveRecord::Migration
  def change
      add_column :products, :shauna, :boolean
  end
end
