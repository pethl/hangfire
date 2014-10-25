class Productlink < ActiveRecord::Base
  belongs_to :product
  belongs_to :productlink, class_name => 'Product'
end
