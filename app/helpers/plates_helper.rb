module PlatesHelper
  
  def categories_to_show # used to control which products are show to be selected in edit plate page
    @categories_to_show = [11,12,13,14,16]
  end
  
  def get_plate_cost(plate)
    
    @productlinks = Productlink.where(:plate_id => plate)
    @plate_cost = 0
      
      @productlinks.each do |productlink|
          @plate_cost += Product.get_total_price(productlink.product_id)
          Rails.logger.debug("after cost: #{@plate_cost.inspect}")
    
    @friends = Friendship.where(:product_id => productlink.product_id)
              if @friends.any?
                @friends.each do |friend|
                   @plate_cost += ((friend.prodvolume) * (get_product_price_per_gram(friend.friend_id).to_f))
                end  
              end
        end
    return @plate_cost
  end
  
  def get_items_cost(product)
    @cost = Product.get_total_price(product)
    friends = Friendship.where(:product_id => product)
    if friends.any?
      friends.each do |friend|
         @cost += ((friend.prodvolume) * (get_product_price_per_gram(friend.friend_id).to_f))
      end  
    end
    return @cost
  end
 
  def get_product_price_per_gram(product_id)
    ppg = Product.get_total_price(product_id)/Product.get_total_weight(product_id)
    return number_with_precision((ppg), :precision => 2)
  end
  
  
end
