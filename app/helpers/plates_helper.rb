module PlatesHelper
  
  def categories_to_show # used to control which products are show to be selected in edit plate page
    @categories_to_show = [11,12,13,14,16]
  end
  
  
  def get_plate_price(plate) #returns the price of a place 
    price = Plate.where(:id => plate).first.price
    return price
  end
  
  def get_plate_price_formatted(plate) #returns the price of a place in £ format
    price = Plate.where(:id => plate).first.price
    return  number_to_currency((price/100), :locale => :en)
  end
  
  
  def get_total_revenue(covers,over_ride_price,plate_id) #returns the total revenue of a plate with x covers
    if over_ride_price.blank? || (over_ride_price == 0)
       (covers.to_f) * (get_plate_price(plate_id))
     else
       covers.to_f*over_ride_price.to_f
     end
  end
  
   def get_total_revenue_formatted(covers,over_ride_price,plate_id)#returns the total revenue of a plate with x covers in £ format
     if over_ride_price.blank? || (over_ride_price == 0)
        currency_format((covers.to_f) * (get_plate_price(plate_id)))
      else
        currency_format(covers.to_f*over_ride_price.to_f) 
      end
   end
   
   def get_total_profit_formatted(covers,over_ride_price,plate_id) #returns the total profit of a plate with x covers
     revenue = get_total_revenue(covers,over_ride_price,plate_id)
     cost = (get_plate_cost(plate_id).to_f)*covers.to_f
     return currency_format(revenue.to_f-cost.to_f)
   end
  
  
  def currency_format(input)
    return  number_to_currency((input/100), :locale => :en)
  end
  

  def get_plate_cost(plate) 
    @productlinks = Productlink.where(:plate_id => plate)
    @plate_cost = 0
      
      @productlinks.each do |productlink|
          @plate_cost += Product.get_total_price(productlink.product_id)
    
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
