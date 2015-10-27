class Saleproduct < ActiveRecord::Base

  validates :name, presence: true 
  validates :stock_quantity, presence: true 
  validates :price, presence: true 
  validates :weight, presence: true 
  validates :remaining_quanity, presence: true 
  validates :status, presence: true
  validates :category_id, presence: true   
 
  STATUS_TYPES = ["Live", "Suspended"]
 
  def self.import(file)
      	 CSV.foreach(file.path, headers: true) do |row|
         		 Saleproduct.create! row.to_hash
      	end
      end
  
end
