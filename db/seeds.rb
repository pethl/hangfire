# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Vendor.create(name: 'Asda')
Vendor.create(name: 'Baker')
Vendor.create(name: 'Booker')
Vendor.create(name: 'Butcher')
Vendor.create(name: 'Tesco')
Vendor.create(name: 'Veg Man')
Category.create(name: 'Bread')
Category.create(name: 'Dairy')
Category.create(name: 'Fruit and Veg')
Category.create(name: 'Meat')
Category.create(name: 'Dry Grocery')
Category.create(name: 'Wet Grocery')
Product.create(name: 'HF BBQ Sauce')
Product.create(name: 'HF Mustard Sauce')
Product.create(name: 'HF Hot Sauce - Red')
Product.create(name: 'HF Hot Sauce - Green')
Product.create(name: 'HF Rub for Beef')
Product.create(name: 'HF Rub for Pork')