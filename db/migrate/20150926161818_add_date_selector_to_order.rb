class AddDateSelectorToOrder < ActiveRecord::Migration
  def change
    add_column :orders, :date_selector, :string
  end
end
