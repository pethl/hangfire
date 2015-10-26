class AddCategoryIdToOrderitem < ActiveRecord::Migration
  def change
    add_column :orderitems, :category_id, :integer
    
  end
end
