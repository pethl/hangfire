class AddUnitItemToIngredients < ActiveRecord::Migration
  def change
    add_column :ingredients, :unit_item, :string
  end
end
