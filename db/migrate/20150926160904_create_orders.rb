class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.date :collection_date
      t.string :contact_person
      t.boolean :marketing
      t.string :phone
      t.string :email

      t.timestamps
    end
  end
end
