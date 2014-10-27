class StaticPagesController < ApplicationController
  
  def home
  end
  
  def dashboard
    @products = Product.all
    @ingredients = Ingredient.all
     @ingredients_category = @ingredients.group_by { |t| t.category_id }
     @vendors = Vendor.all.sort_by { |h| h[:name] }
  end
  
  def help
  end
  
end
