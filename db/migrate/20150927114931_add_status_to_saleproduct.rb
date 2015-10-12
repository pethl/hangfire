class AddStatusToSaleproduct < ActiveRecord::Migration
  def change
    add_column :saleproducts, :status, :string
  end
end
