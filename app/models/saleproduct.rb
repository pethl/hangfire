class Saleproduct < ActiveRecord::Base

  validates :name, presence: true 
  validates :stock_quantity, presence: true 
  validates :price, presence: true 
  validates :weight, presence: true 
  validates :remaining_quanity, presence: true 
  validates :status, presence: true   
 
  STATUS_TYPES = ["Live", "Dead"]

  
  def self.import(file)
      	 CSV.foreach(file.path, headers: true) do |row|
         		 Saleproduct.create! row.to_hash
      	end
      end
  
  
  after_initialize :init

     def init
       self.remaining_quanity = self.stock_quantity          
      
     end
end
