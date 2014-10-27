class Productitem < ActiveRecord::Base
    belongs_to :product
    
    def self.import(file)
        	 CSV.foreach(file.path, headers: true) do |row|
           		 Productitem.create! row.to_hash
        	end
      	end
    
    PRICE_SELECTOR_TYPES = ["--", "average", "latest", "least", "most"]
    
    def self.total_price(productitem)
      if Ingredient.get_price(productitem.ingredient_id, productitem.price_selector).blank?
        return "no data"
      else  
      productitem.volume * Ingredient.get_price(productitem.ingredient_id, productitem.price_selector)
    end
    end
    
    def self.weight_ratio(productitem)
      if productitem.volume.blank?
        return "no data"
      else  
      productitem.volume / Product.get_total_weight(productitem.product_id)
    end
    end
    
    
end
