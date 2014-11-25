class Friendship < ActiveRecord::Base
  belongs_to :product
    belongs_to :friend, :class_name => 'Product'

   
end
