class AddReferenceToCategory < ActiveRecord::Migration
  def change
    add_column :categories, :reference, :string
  end
end
