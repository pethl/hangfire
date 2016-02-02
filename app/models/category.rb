class Category < ActiveRecord::Base
  
   has_many :products
  validates :name, presence: true, uniqueness: true
    validates :reference, presence: true
    
    REFERENCE_VALUE_TYPES = [["ingredient", "ingredient"], ["product", "product"], ["plate", "plate"], ["christmas product", "christmas product"]]
      
    default_scope { order('name ASC') }
    
    def self.get_name(id)
        Category.where(:id => id)[0].name
    end
end
