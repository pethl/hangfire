module IngredientsHelper
  
  def add_baseproduct_link(name)
    link_to_function name do |page|
      page.insert_html :bottom, :baseproduct, :partial => 'baseproduct', :object => Baseproduct.new
    end
  end
  
  #returns the product names of all products that use a given ingredient
  def ingredient_related_product(ingredient)
    @products = Productitem.where(:ingredient_id => ingredient.id).map {|x| [x.product_id]}
    @products = @products.uniq
  end
  
  def ingredient_related_product_count(ingredient)
     @related_products = Productitem.where(:ingredient_id => ingredient.id).map {|x| [x.product_id]}
      
    if @related_products.any?
      @related_products = @related_products.uniq
      return @related_products.count
    else
      return 0
    end
  end
  
  
end
