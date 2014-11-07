module ProductsHelper
  
  
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
  
  
end
