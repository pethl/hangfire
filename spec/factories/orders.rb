# Read about factories at http://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :order do
    collection_date "2015-09-26"
    contact_person "MyString"
    marketing false
    phone "MyString"
    email "MyString"
  end
end
