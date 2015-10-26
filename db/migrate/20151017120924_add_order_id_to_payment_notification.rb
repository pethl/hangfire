class AddOrderIdToPaymentNotification < ActiveRecord::Migration
  def change
    add_column :payment_notifications, :order_id, :integer
  end
end
