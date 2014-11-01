class AddUnitCountToProductitems < ActiveRecord::Migration
  def change
         add_column :productitems, :unit_count, :float
  end
end
