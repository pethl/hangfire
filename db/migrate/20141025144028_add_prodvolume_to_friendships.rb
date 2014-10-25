class AddProdvolumeToFriendships < ActiveRecord::Migration
  def change
          add_column :friendships, :prodvolume, :decimal
  end
end
