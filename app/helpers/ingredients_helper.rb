module IngredientsHelper
  
  def add_baseproduct_link(name)
    link_to_function name do |page|
      page.insert_html :bottom, :baseproduct, :partial => 'baseproduct', :object => Baseproduct.new
    end
  end
  
  #returns the product names of all products that use a given ingredient
  def related_product(ingredient)
    @products = Productitem.where(:ingredient_id => ingredient.id).map {|x| [x.product_id]}
    @products = @products.uniq
  end
  
  def related_product_count(ingredient)
    @products = Productitem.where(:ingredient_id => ingredient.id).map {|x| [x.product_id]}
    if @products.any?
      @products = @products.uniq
      return @products.count
    end
  end
  
  
end
