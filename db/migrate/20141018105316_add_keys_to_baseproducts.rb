class AddKeysToBaseproducts < ActiveRecord::Migration
  def change
        add_column :baseproducts, :ingredient_id, :integer
        add_column :baseproducts, :vendor_id, :integer
  end
end
