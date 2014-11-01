class Product < ActiveRecord::Base
  has_many :productitems
  has_many :friendships
  has_many :friends, :through => :friendships
  
  accepts_nested_attributes_for :productitems, allow_destroy: true
    accepts_nested_attributes_for :friendships, allow_destroy: true
  
    
    def self.get_name(id)
      name = Product.where(:id => id)[0].name
      return name
    end  
    
    def self.get_total_price(id)
      @productitems = Productitem.where(:product_id => id)
      total = @productitems.to_a.sum do |line_item|
        price = Ingredient.get_price(line_item.ingredient_id, line_item.price_selector)
        if price == "no data"
          "missing data"
          return 0
        else
         line_item.volume*Ingredient.get_price(line_item.ingredient_id, line_item.price_selector)
         end
       end
    end
    
    def self.get_plate_total_ratios_price(id)
      @products = Productlink.where(:plate_id => id)
       @all_products_total=[]
        @products.each do |product|
          @all_products_total << Product.get_total_price(product.product_id)
        end
        return @all_products_total.inject 0, :+
    end
    
    def self.get_total_ratios_price(id)
      @products = Friendship.where(:product_id => id)
      @all_products_total=[]
      @products.each do |product|
        @all_products_total << Product.get_ratios_price(product.friend_id,product.prodvolume)
      end
      return @all_products_total.inject 0, :+
    end
      
    def self.get_ratios_price(friend_id,prodvolume)
     # @products = Friendship.where(:product_id => id).map {|x| [x.friend_id, x.prodvolume]}
     # friend = Friendship.where(:friend_id => id).first

        @productitems = Productitem.where(:product_id => friend_id)
          @final_total =[]
          product_total = @productitems.each do |line_item|
            prodratio = Productitem.weight_ratio(line_item)
            new_weight = ((prodvolume)*(Productitem.weight_ratio(line_item)).to_f)
            price_per = Ingredient.get_price(line_item.ingredient_id, line_item.price_selector)
            @final_total << (new_weight.to_f)*(price_per)
        end
        return @final_total.inject 0, :+
    end    
    
    def self.get_total_weight(id)
      @productitems = Productitem.where(:product_id => id)
      weight = @productitems.to_a.sum do |line_item|
         if !line_item.volume.blank?
           line_item.volume
         else
           line_item.unit_count * (Ingredient.get_unit_weight(line_item.ingredient_id))
         end
       end
    end    
  
end
