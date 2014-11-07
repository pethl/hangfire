class Category < ActiveRecord::Base
  
   has_many :products
  validates :name, presence: true, uniqueness: true
    validates :reference, presence: true
end
