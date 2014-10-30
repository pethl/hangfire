# Read about factories at http://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :plate do
    price "9.99"
    name "MyString"
    category_id 1
  end
end
