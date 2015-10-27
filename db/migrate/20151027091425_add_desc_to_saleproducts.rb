class AddDescToSaleproducts < ActiveRecord::Migration
  def change
    add_column :saleproducts, :desc, :text
  end
end
