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
         line_item.volume*Ingredient.get_price(line_item.ingredient_id, line_item.price_selector)
         end
    end

    
    def self.get_total_test_price(id) ##this is counting total cost of other product needs the %volume calculation added
      # get all product_ids associated with this product, they are in Friendship model under friend_id linked b product_id
      @product_ids = Friendship.where(:product_id => id).map {|x| [x.friend_id, x.prodvolume]}
      # get all product items records that have product ids in the @product_ids array
      @productitems = Productitem.where(:product_id => @product_ids)
      test_total = @productitems.to_a.sum do |line_item|
         line_item.volume*Ingredient.get_price(line_item.ingredient_id, line_item.price_selector)
         end
    end
    
    def self.get_total_ratios_price(id)
     # @products = Friendship.where(:product_id => id).map {|x| [x.friend_id, x.prodvolume]}
      @friends = Friendship.where(:product_id => id)
        
       # @friends.each do |friend|
             full_total = @friends.to_a.sum do |friend|
               
        @productitems = Productitem.where(:product_id => friend.product_id)
          product_total = @productitems.to_a.sum do |line_item|
 
            ((friend.prodvolume)*(Productitem.weight_ratio(line_item)).to_f) * (Ingredient.get_price(line_item.ingredient_id, line_item.price_selector)).to_f
          end
        end
      end
      
        def self.get_ratios_price(id)
         # @products = Friendship.where(:product_id => id).map {|x| [x.friend_id, x.prodvolume]}
          friend = Friendship.where(:product_id => id).first

            @productitems = Productitem.where(:product_id => friend.product_id)
              product_total = @productitems.to_a.sum do |line_item|
                ((friend.prodvolume)*(Productitem.weight_ratio(line_item)).to_f) * (Ingredient.get_price(line_item.ingredient_id, line_item.price_selector)).to_f
              end
    end    
    
    def self.get_total_weight(id)
      @productitems = Productitem.where(:product_id => id)
      weight = @productitems.to_a.sum do |line_item|
         line_item.volume
         end
    end    
  
end
