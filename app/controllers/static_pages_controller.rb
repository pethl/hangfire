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
  end
  
  def help
  end
  
end
