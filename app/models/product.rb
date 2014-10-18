class Product < ActiveRecord::Base
  has_many :items
  
    MEAT_TYPES = ["--", "Beef", "Chicken", "Duck", "Pork", "Turkey"]
    
    def self.get_name(id)
      name = Product.where(:id => id)[0].name
      return name
    end  
  
end
