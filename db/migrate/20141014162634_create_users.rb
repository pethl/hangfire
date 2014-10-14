class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :lastname
      t.string :email
      t.string :phone
      t.string :bill_addr1
      t.string :bill_addr2
      t.string :bill_addr3
      t.string :bill_addr4
      t.string :bill_postcode
      t.string :delivery_addr1
      t.string :delivery_addr2
      t.string :delivery_addr3
      t.string :delivery_addr4
      t.string :delivery_postcode
      t.string :password_digest

      t.timestamps
    end
  end
end
