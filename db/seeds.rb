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
Product.create(name: 'HF BBQ Sauce Batch', category_id: 15)
Product.create(name: 'HF Espresso Sauce Batch', category_id: 15)
Product.create(name: 'HF Mustard Sauce Batch', category_id: 15)
Product.create(name: 'HF Cajun Fry', category_id: 15)
Product.create(name: 'HF Dry Shake', category_id: 15)
Product.create(name: 'HF Chip Shake', category_id: 15)
Product.create(name: 'HF Original Hot Sauce', category_id: 14)
Product.create(name: 'HF Hot Sauce - Green', category_id: 14)
Product.create(name: 'HF Beef Rub', category_id: 14)
Product.create(name: 'HF Chicken Rub', category_id: 14)
Product.create(name: 'HF Pig Rub', category_id: 14)
Product.create(name: 'HF Beef Rub Batch', category_id: 15)
Product.create(name: 'HF Chicken Rub Batch', category_id: 15)
Product.create(name: 'HF Pig Rub Batch', category_id: 15)
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
Ingredient.create(name: 'Bread - tin loaf', category_id: 1)
Ingredient.create(name: 'Ciabatta', category_id: 1)
Ingredient.create(name: 'Granary batons', category_id: 1)
Ingredient.create(name: 'Rolls - white round', category_id: 1)
Ingredient.create(name: 'Hotdog roll', category_id: 1)
Ingredient.create(name: 'Butter - salted', category_id: 2)
Ingredient.create(name: 'Butter - unsalted', category_id: 2)
Ingredient.create(name: 'Cream - double', category_id: 2)
Ingredient.create(name: 'Milk - full fat', category_id: 2)
Ingredient.create(name: 'Milk - semi-skimmed', category_id: 2)
Ingredient.create(name: 'Halloumi', category_id: 2)
Ingredient.create(name: 'Cabbage - white', category_id: 3)
Ingredient.create(name: 'Leeks', category_id: 3)
Ingredient.create(name: 'Carrots', category_id: 3)
Ingredient.create(name: 'Pepper - red - bell', category_id: 3)
Ingredient.create(name: 'Pepper - green - bell', category_id: 3)
Ingredient.create(name: 'Onion - spring', category_id: 3)
Ingredient.create(name: 'Celery', category_id: 3)
Ingredient.create(name: 'Onion - white', category_id: 3)
Ingredient.create(name: 'Parsley - curly', category_id: 3)
Ingredient.create(name: 'Parsley - flat leaf', category_id: 3)
Ingredient.create(name: 'Corriander', category_id: 3)
Ingredient.create(name: 'Onion - red', category_id: 3)
Ingredient.create(name: 'Rocket', category_id: 3)
Ingredient.create(name: 'Bacon - smoked back', category_id: 4)
Ingredient.create(name: 'Beef brisket', category_id: 4)
Ingredient.create(name: 'Pork shoulder', category_id: 4)
Ingredient.create(name: 'Pork ribs', category_id: 4)
Ingredient.create(name: 'Chicken Leg Thigh', category_id: 4)
Ingredient.create(name: 'Lamb shoulder', category_id: 4)
Ingredient.create(name: 'Lamb leg', category_id: 4)
Ingredient.create(name: 'Chicken Breast', category_id: 4)
Ingredient.create(name: 'Texas Hot Links', category_id: 10)
Ingredient.create(name: 'Turkey', category_id: 4)
Ingredient.create(name: 'Duck', category_id: 4)
Ingredient.create(name: 'Macaroni', category_id: 5)
Ingredient.create(name: 'Flour - self-raising', category_id: 5)
Ingredient.create(name: 'Flour - plain', category_id: 5)
Ingredient.create(name: 'Cornmeal', category_id: 5)
Ingredient.create(name: 'Sugar - Molasses', category_id: 5)
Ingredient.create(name: 'Sugar - Muscovado', category_id: 5)
Ingredient.create(name: 'Stockcubes - lamb', category_id: 5)
Ingredient.create(name: 'Sugar - granulated', category_id: 5)
Ingredient.create(name: 'Garlic - granules', category_id: 5)
Ingredient.create(name: 'Garlic - powder', category_id: 5)
Ingredient.create(name: 'Corriander - ground', category_id: 5)
Ingredient.create(name: 'Cumin - ground', category_id: 5)
Ingredient.create(name: 'Black Pepper - cracked', category_id: 5)
Ingredient.create(name: 'Salt - cooking', category_id: 5)
Ingredient.create(name: 'Paprika - smoked', category_id: 5)
Ingredient.create(name: 'Mixed spices', category_id: 5)
Ingredient.create(name: 'Turmeric - ground', category_id: 5)
Ingredient.create(name: 'Chilli - powder', category_id: 5)
Ingredient.create(name: 'Stockcubes - chicken', category_id: 5)
Ingredient.create(name: 'Lamb Gravy_Stock', category_id: 6)
Ingredient.create(name: 'Beans - borlotti', category_id: 6)
Ingredient.create(name: 'Beans - pinto', category_id: 6)
Ingredient.create(name: 'Beans - black eyed', category_id: 6)
Ingredient.create(name: 'Passata', category_id: 6)
Ingredient.create(name: 'Tomato puree', category_id: 6)
Ingredient.create(name: 'Chutney - spiced fruity', category_id: 6)
Ingredient.create(name: 'Chutney - tomato', category_id: 6)
Ingredient.create(name: 'Jam - Apricot', category_id: 6)
Ingredient.create(name: 'Beans - red kidney', category_id: 6)
Ingredient.create(name: 'Vinegar - white distilled', category_id: 6)
Ingredient.create(name: 'Tomato ketchup', category_id: 6)
Ingredient.create(name: 'Mustard - American', category_id: 6)
Ingredient.create(name: 'Mayonnaise', category_id: 6)
Ingredient.create(name: 'Gherkins - dill sliced', category_id: 6)
Ingredient.create(name: 'Tomato chopped', category_id: 6)
Ingredient.create(name: 'Chutney - onion', category_id: 6)
Ingredient.create(name: 'Paste - Chilli and Garlic', category_id: 6)
Ingredient.create(name: 'Paprika', category_id: 5)
Ingredient.create(name: 'Celery - seed', category_id: 5)
Ingredient.create(name: 'Cinnamon - ground', category_id: 5)
Ingredient.create(name: 'Onion powder', category_id: 5)
Ingredient.create(name: 'Rosemary - dried', category_id: 5)
Ingredient.create(name: 'Oregano - dried', category_id: 5)
Ingredient.create(name: 'Thyme - dried', category_id: 5)
Ingredient.create(name: 'Nutmeg', category_id: 5)
Ingredient.create(name: 'Juniper berries', category_id: 5)
Ingredient.create(name: 'Cloves - ground', category_id: 5)
Ingredient.create(name: 'Celery salt', category_id: 5)
Ingredient.create(name: 'Mustard powder', category_id: 5)
Ingredient.create(name: 'Stockcubes - beef', category_id: 5)
Ingredient.create(name: 'Stockcubes - vegetable', category_id: 5)
Ingredient.create(name: 'Sugar - icing', category_id: 5)
Ingredient.create(name: 'Sugar - light brown', category_id: 5)
Ingredient.create(name: 'Vinegar - cider', category_id: 6)
Ingredient.create(name: 'Walnut', category_id: 5)
Ingredient.create(name: 'Coffee - espresso powder', category_id: 5)
Ingredient.create(name: 'Porridge oats', category_id: 5)
Ingredient.create(name: 'Gravy browning', category_id: 6)
Ingredient.create(name: 'Baking powder', category_id: 5)
Ingredient.create(name: 'Jalapenos - red sliced', category_id: 6)
Ingredient.create(name: 'Jalepenos - green sliced', category_id: 6)
Ingredient.create(name: 'Mini bread rolls', category_id: 1)
Ingredient.create(name: 'Eggs - large', category_id: 2)
Ingredient.create(name: 'Beer', category_id: 6)
Ingredient.create(name: 'Garlic - peeled', category_id: 3)
Ingredient.create(name: 'Lettuce', category_id: 3)
Ingredient.create(name: 'Cabbage - red', category_id: 3)
Ingredient.create(name: 'Chillis - red serrano', category_id: 3)
Ingredient.create(name: 'Chillis - green serrano', category_id: 3)
Ingredient.create(name: 'Lime juice', category_id: 6)
Ingredient.create(name: 'Liquid AFS 3', category_id: 6)
Ingredient.create(name: 'Kitchen Roll', category_id: 7)
Ingredient.create(name: 'Wooden Fork', category_id: 7)
Ingredient.create(name: 'Wooden Spoon', category_id: 7)
Ingredient.create(name: 'Wooden Knife', category_id: 7)
Ingredient.create(name: '6oz Paper Cup', category_id: 7)
Ingredient.create(name: 'Greaseproof Paper', category_id: 7)
Ingredient.create(name: 'Plates - kids', category_id: 7)
Ingredient.create(name: 'Plates - side', category_id: 7)
Ingredient.create(name: 'Plates - oval', category_id: 7)
Ingredient.create(name: 'Hand wipes', category_id: 7)
Ingredient.create(name: 'Blue gloves', category_id: 9)
Ingredient.create(name: 'Cling film', category_id: 9)
Ingredient.create(name: 'Tin foil', category_id: 9)
Ingredient.create(name: 'Vac pack bags - large', category_id: 9)
Ingredient.create(name: 'Vac pack bags - medium', category_id: 9)
Ingredient.create(name: 'Vac pack bags - small', category_id: 9)
Ingredient.create(name: 'Chocolate Brownie', category_id: 10)
Ingredient.create(name: 'Pecan Pie', category_id: 10)
Ingredient.create(name: 'Key Lime', category_id: 10)
Ingredient.create(name: 'Frankfurter', category_id: 10)
Ingredient.create(name: 'Chuck Mince', category_id: 4)
Ingredient.create(name: 'Beef ribs', category_id: 4)
Ingredient.create(name: 'Feather Steak', category_id: 4)
Ingredient.create(name: 'Worcester Sauce', category_id: 6)
Ingredient.create(name: 'Water', category_id: 6)
Ingredient.create(name: 'Bottle and lid - glass - 330ml', category_id: 7)
Ingredient.create(name: 'Label - sauces', category_id: 7)
Ingredient.create(name: 'Bottle and lid - glass - 270ml', category_id: 7)
User.create!(first_name:  "lisa",
              lastname: "pethick",
             email: "pethicklisa@gmail.com",
             password:              "foobar",
             password_confirmation: "foobar",
             admin: true)