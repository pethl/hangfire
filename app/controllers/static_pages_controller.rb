class StaticPagesController < ApplicationController
  
  def home
  end
  
  def dashboard
    @products = Product.all
    @ingredients = Ingredient.all
     @ingredients_category = @ingredients.group_by { |t| t.category_id }
  end
  
  def help
  end
  
end
