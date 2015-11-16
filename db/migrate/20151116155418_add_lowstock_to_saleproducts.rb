class AddLowstockToSaleproducts < ActiveRecord::Migration
  def change
      add_column :saleproducts, :lowstock, :integer
      add_column :saleproducts, :soldout, :integer
  end
end
