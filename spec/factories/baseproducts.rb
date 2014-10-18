# Read about factories at http://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :baseproduct do
    name "MyString"
    purchase_date "2014-10-18"
    unit_weight "9.99"
    total_weight "9.99"
    unit_count "9.99"
    total_price "9.99"
    unit_price "9.99"
    price_per "9.99"
  end
end
