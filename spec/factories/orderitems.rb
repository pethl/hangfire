# Read about factories at http://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :orderitem do
    order_id 1
    saleproduct_id 1
    quantity 1
    item_price "9.99"
    total_price "9.99"
  end
end
