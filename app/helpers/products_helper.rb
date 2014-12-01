module ProductsHelper

  def product_categories_to_add
    @product_categories_to_add = [15,19]
  end

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
    ppg = get_items_cost(product_id)/Product.get_total_weight(product_id)
    return number_with_precision((ppg), :precision => 2)
  end
  
  def get_items_cost(product)
    @cost = Product.get_total_price(product)
    friends = Friendship.where(:product_id => product)
    if friends.any?
      friends.each do |friend| 
        if !friend.prodvolume.blank?
         @cost += ((friend.prodvolume) * (get_product_price_per_gram(friend.friend_id).to_f))
        else
          
       end
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

  #returns the plate names of all plates that use a given product
  def related_plate(product)
    @plates = Productlink.where(:product_id => product.id).map {|x| [x.plate_id]}
    @plates = @plates.uniq
  end
  
  def related_plate_count(product)
    @plates = Productlink.where(:product_id => product.id).map {|x| [x.plate_id]}
    if @plates.any?
      @plates = @plates.uniq
      return @plates.count
    end
  end

  #returns the plate names of all plates that use a given product
  def related_product(product)
    @products = Friendship.where(:product_id => product.id).map {|x| [x.friend_id]}
    @products = @products.uniq
  end
  
  def related_product_count(product)
    @products = Friendship.where(:product_id => product.id).map {|x| [x.friend_id]}
    if @products.any?
      @products = @products.uniq
      return @products.count
    end
  end
  def shauna_format(product)
     if product.shauna.blank?
       return "No"
    elsif product.shauna = true
      return "Yes"
    else
      return "No"
      end  
  end
  
end
