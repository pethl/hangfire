class Productitem < ActiveRecord::Base
    belongs_to :product
   # after_save :calc_volume
   
   validate :check_vol_or_unit #ensure a unit count or volume is always entered 

   def check_vol_or_unit
     if volume.blank? and unit_count.blank?
      #one at least must be filled in
      errors.add(:base, ': You must enter ingredient volume or unit count') if volume.blank? and unit_count.blank?
      return false
    
     else
      return true
     end
   end
   
    
    def self.import(file)
        	 CSV.foreach(file.path, headers: true) do |row|
           		 Productitem.create! row.to_hash
        	end
      	end
    
    PRICE_SELECTOR_TYPES = ["--", "average", "latest", "least", "most"]

    # this function should return true if the productitem is a food ingredient and false if its a non-food item
    def self.food_category(productitem)
       return Product.categories_to_ignore.include? (Ingredient.get_category(productitem.ingredient_id))
    end

    
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
    
    def self.weight_ratio(productitem,friend)
      if friend == 0
            if !productitem.unit_count.blank?
              a = (productitem.unit_count.to_f*(Ingredient.get_unit_weight(productitem.ingredient_id)))
              b =  Product.get_total_weight(productitem.product_id)
              return a/b
            else  
            productitem.volume / Product.get_total_weight(productitem.product_id)
          end
        
      elsif productitem == 0
        friend.prodvolume / Product.get_total_weight(friend.product_id)
      end
    end
    
end
