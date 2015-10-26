class AddFieldsToOrder < ActiveRecord::Migration
  def change
    add_column :orders, :guid, :string
    add_column :orders, :strip_id, :string
  end
end
