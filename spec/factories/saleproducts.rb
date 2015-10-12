# Read about factories at http://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :saleproduct do
    name "MyString"
    stock_quantity 1
    remaining_quanity 1
    price "9.99"
    weight "MyString"
    category_id 1
  end
end
