class Productitem < ActiveRecord::Base
    belongs_to :product
   # after_save :calc_volume
    
    def self.import(file)
        	 CSV.foreach(file.path, headers: true) do |row|
           		 Productitem.create! row.to_hash
        	end
      	end
    
    PRICE_SELECTOR_TYPES = ["--", "average", "latest", "least", "most"]
    
    def self.total_price(productitem)
      if Ingredient.get_price(productitem.ingredient_id, productitem.price_selector) == "no data"
        return "no data"
      elsif  
        !productitem.volume.blank?
      productitem.volume * Ingredient.get_price(productitem.ingredient_id, productitem.price_selector)
    else
      productitem.update(:volume => productitem.unit_count* Ingredient.get_unit_weight(productitem.ingredient_id))
      productitem.volume = productitem.unit_count* Ingredient.get_unit_weight(productitem.ingredient_id)
       productitem.volume * Ingredient.get_price(productitem.ingredient_id, productitem.price_selector)
      end
    end
    
    def self.weight_ratio(productitem)
      if !productitem.unit_count.blank?
        a = (productitem.unit_count.to_f*(Ingredient.get_unit_weight(productitem.ingredient_id)))
        b=  Product.get_total_weight(productitem.product_id)
        return a/b
  Rails.logger.debug("in weight_ration where unit count not  blank: #{productitem.unit_count.inspect}")

      else  
          Rails.logger.debug("in weight_ration else: #{productitem.unit_count.inspect}")
      productitem.volume / Product.get_total_weight(productitem.product_id)
    end
    end
    
end
