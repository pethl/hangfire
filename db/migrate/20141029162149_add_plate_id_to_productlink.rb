class AddPlateIdToProductlink < ActiveRecord::Migration
  def change
     add_column :productlinks, :plate_id, :integer
  end
end
