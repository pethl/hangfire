module StaticPagesHelper
  
  def count_by_category(category)
        case category.reference
          when "ingredient"
              Ingredient.where(:category_id => category.id).count
          when "product"
              Product.where(:category_id => category.id).count
          when "plate"
              Plate.where(:category_id => category.id).count
          else
            return "-"
        end
  end
end
