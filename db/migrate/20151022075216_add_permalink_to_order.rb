class AddPermalinkToOrder < ActiveRecord::Migration
  def change
    add_column :orders, :permalink, :string
    
  end
end
