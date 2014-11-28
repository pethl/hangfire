# Read about factories at http://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :eventplate do
    eventplanner_id 1
    plate_id 1
    covers 1
    over_ride_price "9.99"
  end
end
