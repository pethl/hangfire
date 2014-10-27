class Category < ActiveRecord::Base
  
  validates :name, presence: true, uniqueness: true
    validates :reference, presence: true
end
