class AddPriceSelectorToProductItem < ActiveRecord::Migration
  def change
      add_column :productitems, :price_selector, :string
  end
end
