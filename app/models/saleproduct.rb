class Saleproduct < ActiveRecord::Base

  validates :name, presence: true 
  validates :stock_quantity, presence: true 
  validates :price, presence: true 
  validates :weight, presence: true 
  validates :remaining_quanity, presence: true 
  validates :status, presence: true
  validates :category_id, presence: true 
    validates :sort, presence: true  
   default_scope { order('sort ASC') } 
 
  STATUS_TYPES = ["Live", "Suspended"]
 
  def self.import(file)
      	 CSV.foreach(file.path, headers: true) do |row|
         		 Saleproduct.create! row.to_hash
      	end
      end
      
  def self.gifts_n_packs
    gnp = Array.new
    gnp << Saleproduct.where("name like ?", "%ift%").pluck(:id)
    gnp << Saleproduct.where("name like ?", "%arty%").pluck(:id)
    gnp = gnp.flatten
    return gnp
  end    
  
end
