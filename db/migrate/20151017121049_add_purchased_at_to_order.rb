class AddPurchasedAtToOrder < ActiveRecord::Migration
  def change
    add_column :orders, :puchased_at, :datetime
  end
end
