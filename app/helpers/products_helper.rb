module ProductsHelper

#this counts how many ingredients linked to a product
  def get_ingredients_count(id)
    return Productitem.where(:product_id => id).count
  end

#this returns the cost of ingredients linked to a product, based on productitem weights 
  def get_ingredients_cost(id)
      @productitems = Productitem.where(:product_id => id)
     # @total = 0
      @total = @productitems.to_a.sum do |line_item|
        price = Ingredient.get_price(line_item.ingredient_id, line_item.price_selector)
        if price == "no data"
          "missing data"
          return 0
        else
             if !line_item.volume.blank?
              line_item.volume*price
             else
               uc = line_item.unit_count * (Ingredient.get_unit_weight(line_item.ingredient_id))
               uc*price
             end
        end
     end
  end

#this returns the total weight of all ingredients linked to a product
  def get_ingredients_weight(id)
      @productitems = Productitem.where(:product_id => id)
      @weight = 0
      @weight = @productitems.to_a.sum do |productitem|
         if !productitem.volume.blank?
           productitem.volume
         else
           productitem.unit_count * (Ingredient.get_unit_weight(productitem.ingredient_id))
         end
       end
   
  end
  
  def get_all_ingredients_price_per_gram(id)
    unless id.productitems.count == 0
        (Product.get_total_price(id))/(Product.get_total_weight(id))
      end
  end
  
  
  def get_ratio_formatted(productitem_volume, product_id)
    original_product_total_weight = Product.get_total_weight(product_id)
    weight_ratio = productitem_volume/original_product_total_weight
    return number_with_precision((weight_ratio)*100, :precision => 2)
  end
  
  def get_ratio(productitem_volume, product_id)
    original_product_total_weight = Product.get_total_weight(product_id)
    weight_ratio = productitem_volume/original_product_total_weight
    return weight_ratio
  end
  
  def get_weight_by_ratio_formatted(friendprodvolume,productitem_volume,product_id)
    ratio = get_ratio(productitem_volume,product_id)
    return number_with_precision((friendprodvolume*ratio), :precision => 2)
  end

  def get_weight_by_ratio(friendprodvolume,productitem_volume,product_id)
    ratio = get_ratio(productitem_volume,product_id)
    return friendprodvolume*ratio
  end
  
  def get_product_price_per_gram(product_id)
    ppg = Product.get_total_price(product_id)/Product.get_total_weight(product_id)
    return number_with_precision((ppg), :precision => 2)
  end
  
  def get_items_cost(product)
    @cost = Product.get_total_price(product)
    friends = Friendship.where(:product_id => product)
    if friends.any?
      friends.each do |friend|
                Rails.logger.debug(">>>>>>>>>in helper_items_cost_in_friend: #{friend.inspect}") 
         @cost += ((friend.prodvolume) * (get_product_price_per_gram(friend.friend_id).to_f))
          Rails.logger.debug("friend.prodvolume: #{friend.prodvolume.inspect}") 
                    Rails.logger.debug("friend.price_per: #{get_product_price_per_gram(friend.friend_id).inspect}") 
        Rails.logger.debug("in helper_items_cost_@cost: #{@cost.inspect}") 
      end  
    end
    return @cost
  end

  #this will return a count of all ingredients and associated products that belong to this product  
  def get_items_count(product)
    @count = product.productitems.count
    @count += product.friendships.count 
      return @count
  end
  
  
end
