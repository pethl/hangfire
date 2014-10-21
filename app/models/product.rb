class Product < ActiveRecord::Base
  has_many :productitems
  
    
    def self.get_name(id)
      name = Product.where(:id => id)[0].name
      return name
    end  
  
end
