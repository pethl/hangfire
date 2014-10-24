class Productitem < ActiveRecord::Base
    belongs_to :product
    
    
    PRICE_SELECTOR_TYPES = ["--", "average", "latest", "least", "most"]
    
   
    
    def self.total_price(productitem)
      if Ingredient.get_price(productitem.ingredient_id, productitem.price_selector).blank?
        return "no data"
      else  
      productitem.volume * Ingredient.get_price(productitem.ingredient_id, productitem.price_selector)
    end
    end
    
    
end
