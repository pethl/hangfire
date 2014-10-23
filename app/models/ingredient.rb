class Ingredient < ActiveRecord::Base
  has_many :baseproducts
  accepts_nested_attributes_for :baseproducts, allow_destroy: true
  
    validates :name, presence: true, uniqueness: true
      validates :category_id, presence: true

  
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
