class StaticPagesController < ApplicationController
    before_action :signed_in_user, only: [:dashboard, :help, :admin]
  def home
  end
  
  def dashboard
    @products = Product.all
    @products_by_category = @products.group_by { |t| t.category_id }
    @ingredients = Ingredient.all
     @ingredients_category = @ingredients.group_by { |t| t.category_id }
     @vendors = Vendor.all.sort_by { |h| h[:name] }
     @categories_by_reference = Category.all.group_by { |t| t.reference }
  end
  
  def help
  end
  
  def xmas_order
    @saleproducts = Saleproduct.all
  end
  

end
