class Ingredient < ActiveRecord::Base
  has_many :baseproducts
  
  def self.import(file)
      	 CSV.foreach(file.path, headers: true) do |row|
         		 Ingredient.create! row.to_hash
      	end
    	end
    	
    
end
