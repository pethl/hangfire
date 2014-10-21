class Productitem < ActiveRecord::Base
    belongs_to :product
    
    def self.average_price(id)
      a = Baseproduct.where(:ingredient_id => id)
      a.average('price_per')
     
    end
    
    def self.total_price(productitem)
      if self.average_price(productitem.ingredient_id).blank?
        return "zero"
      else  
      productitem.volume * self.average_price(productitem.ingredient_id)
    end
    end
    
end
