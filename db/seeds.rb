# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Vendor.create(name: 'Asda')
Vendor.create(name: 'Alans Bakery')
Vendor.create(name: 'Farmers Pantry')
Vendor.create(name: 'Tesco')
Vendor.create(name: 'Matt Fresh')
Vendor.create(name: 'Booker')
Vendor.create(name: 'Charcuterie Ltd')
Vendor.create(name: 'Amazon')
Vendor.create(name: 'American BBQ')
Vendor.create(name: 'Awesome Merchandise')
Vendor.create(name: 'McGowans Printers')
Vendor.create(name: 'Brolyn Butcher Supplies')
Vendor.create(name: 'Deli Store')
Vendor.create(name: 'Rawlings')
Vendor.create(name: 'Ampulaa')
Vendor.create(name: 'Nisbets')
Vendor.create(name: 'Doug Willis')
Vendor.create(name: 'Co-op')
Vendor.create(name: 'Filco')
Vendor.create(name: 'South Devon Chilli Company')
Vendor.create(name: 'Unbar Rothon Ltd')
Category.create(name: 'Bread', reference: 'ingredient')
Category.create(name: 'Dairy', reference: 'ingredient')
Category.create(name: 'Fruit and Veg', reference: 'ingredient')
Category.create(name: 'Meat', reference: 'ingredient')
Category.create(name: 'Dry Grocery', reference: 'ingredient')
Category.create(name: 'Wet Grocery', reference: 'ingredient')
Category.create(name: 'Front of House Service', reference: 'ingredient')
Category.create(name: 'Cleaning', reference: 'ingredient')
Category.create(name: 'Kitchen Essentials', reference: 'ingredient')
Category.create(name: 'Sub-contractors', reference: 'ingredient')
Category.create(name: 'Sub-contractors', reference: 'ingredient')
Category.create(name: 'Mains', reference: 'product')
Category.create(name: 'Sides', reference: 'product')
Category.create(name: 'Desserts', reference: 'product')
Category.create(name: 'For sale', reference: 'product')
Category.create(name: 'Kitchen Product', reference: 'product')
Product.create(name: 'HF BBQ Sauce', category_id: 14)
Product.create(name: 'HF Espresso Sauce', category_id: 14)
Product.create(name: 'HF Mustard Sauce', category_id: 14)
Product.create(name: 'HF Cajun Fry', category_id: 15)
Product.create(name: 'HF Dry Shake', category_id: 14)
Product.create(name: 'HF Chip Shake', category_id: 14)
Product.create(name: 'HF Original Hot Sauce', category_id: 14)
Product.create(name: 'HF Hot Sauce - Green', category_id: 14)
Product.create(name: 'HF Beef Rub', category_id: 14)
Product.create(name: 'HF Chicken Rub', category_id: 14)
Product.create(name: 'HF Pig Rub', category_id: 14)
Product.create(name: 'HF Coleslaw', category_id: 12)
Product.create(name: 'HF BBQ Beans', category_id: 12)
Product.create(name: 'HF Etouffee', category_id: 12)
Product.create(name: 'HF Mac n Cheese', category_id: 12)
Product.create(name: 'HF Kentucky Burgoo', category_id: 12)
Product.create(name: 'HF Green Chilli Stew', category_id: 12)
Product.create(name: 'HF Brunswick Stew', category_id: 12)
Product.create(name: 'HF Hot Wings', category_id: 12)
Product.create(name: 'HF Hush Puppies', category_id: 12)
Product.create(name: 'HF Burnt Ends', category_id: 12)
Product.create(name: 'HF Chowchow', category_id: 15)
Product.create(name: 'HF Halloumi Burger', category_id: 11)
Product.create(name: 'HF Maque Choux', category_id: 12)
Product.create(name: 'HF Gumbo', category_id: 12)
Product.create(name: 'HF Seasoned Matchstick Fries', category_id: 12)
Product.create(name: 'HF Ice Cream', category_id: 13)
Product.create(name: 'HF Key Lime Pie', category_id: 13)
Product.create(name: 'HF Chocolate Brownies', category_id: 13)
Product.create(name: 'HF Pecan Pie', category_id: 13)
Product.create(name: 'HF Pumpkin Pie', category_id: 13)














