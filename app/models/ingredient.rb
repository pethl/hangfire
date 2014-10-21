class Ingredient < ActiveRecord::Base
  has_many :baseproducts
  
  def self.import(file)
      	 CSV.foreach(file.path, headers: true) do |row|
         		 Ingredient.create! row.to_hash
      	end
    	end
    	
  def self.average_price(id)
    a = Baseproduct.where(:ingredient_id => id)
    a.average('price_per')
  end
    
end
