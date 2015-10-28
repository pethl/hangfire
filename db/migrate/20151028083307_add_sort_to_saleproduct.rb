class AddSortToSaleproduct < ActiveRecord::Migration
  def change
      add_column :saleproducts, :sort, :integer
  end
end
