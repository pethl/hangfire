# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Vendor.create(name: 'Booker')
Vendor.create(name: 'Tesco')
Vendor.create(name: 'Asda')
Vendor.create(name: 'Veg Man')
Vendor.create(name: 'Butcher')
Category.create(name: 'Fruit and Veg')
Category.create(name: 'Meat')
Category.create(name: 'Bread')
Category.create(name: 'Dry Grocery')
Category.create(name: 'Wet Grocery')