class AddShrinkageToIngredient < ActiveRecord::Migration
  def change
        add_column :ingredients, :shrinkage, :decimal
  end
end
