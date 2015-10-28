class AddSortToOrderitems < ActiveRecord::Migration
  def change
    add_column :orderitems, :sort, :integer
  end
end
