# Read about factories at http://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :productitem do
    product_id 1
    ingredient_id 1
    volume "9.99"
  end
end
