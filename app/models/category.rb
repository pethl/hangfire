class Category < ActiveRecord::Base
  
   has_many :products
  validates :name, presence: true, uniqueness: true
    validates :reference, presence: true
    
    def self.get_name(id)
        Category.where(:id => id)[0].name
    end
end
