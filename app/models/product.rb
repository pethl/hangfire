class Product < ActiveRecord::Base
  has_many :productitems
  
    
    def self.get_name(id)
      name = Product.where(:id => id)[0].name
      return name
    end  
    
    def self.get_total_price(id)
      @productitems = Productitem.where(:product_id => id)
      total = @productitems.to_a.sum do |line_item|
         line_item.volume*Productitem.average_price(line_item.ingredient_id)
         end
    end
  
end
