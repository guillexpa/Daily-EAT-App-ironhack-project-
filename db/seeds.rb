# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# User.create(username: 'Escalicha', email: 'escalicha@yea.com', password_digest: BCrypt::Password.create("my password"))
# User.create(username: 'Pau', email: 'pau@yea.com', password_digest: 'cjhenlwieuo3209iekdls')
# User.create(username: 'Jose', email: 'jose@yea.com', password_digest: '29834u9rjf8923jdm')
# User.create(username: 'Antoni', email: 'antoni@hotmail.com', password_digest: 'woiemried,epokol32')
# User.create(username: 'Daniela', email: 'daniela@yea.com', password_digest: 'qweu9138742343rf23dewdwewrt9381jrio2301938')
# User.create(username: 'Sophie', email: 'sohpie@hotmail.com', password_digest: '22423r91387493812930ikdwd301938')
# User.create(username: 'Rodrigo', email: 'rodrigo@yea.com', password_digest: 'qweu9138749381jrio2301938')
# User.create(username: 'Edu', email: 'edu@yea.com', password_digest: '111111111$$$$23e3d4t42e3dwr')
# User.create(username: 'Lilith', email: 'lilith@hotmail.com', password_digest: 'wcreg4567689876543|@#~')
# User.create(username: 'Thor', email: 'thor@hotmail.com', password_digest: '@qerqdw#sfwecd')
# User.create(username: 'Matias', email: 'matias@yea.com', password_digest: '$$23r3d233$243ew')



Ingredient.create(name: 'Tomato', ing_type: 'Vegetable', description: 'Fresh from Valencia', gluten: true, lactose: true)
Ingredient.create(name: 'Cheese', ing_type: 'Lactic', description: 'Fresh mozzarella from Italy', gluten: true, lactose: false)
Ingredient.create(name: 'Bread', ing_type: 'Bread', description: 'Baked this morning', gluten: false, lactose: true)
Ingredient.create(name: 'Penne', ing_type: 'Pasta', description: 'From our provider', gluten: false, lactose: true)
Ingredient.create(name: 'Lettuce', ing_type: 'Vegetable', description: 'Fresh from el huerto', gluten: true, lactose: true)
Ingredient.create(name: 'Pepper', ing_type: 'Vegetable', description: 'Just sauce', gluten: true, lactose: false)
Ingredient.create(name: 'Salt', ing_type: 'Species', description: 'Just pepper', gluten: true, lactose: false)
Ingredient.create(name: 'Orange', ing_type: 'Fruit', description: 'Just orange', gluten: true, lactose: false)
Ingredient.create(name: 'Jamón', ing_type: 'Sauce', description: 'Just jamon', gluten: true, lactose: false)
Ingredient.create(name: 'Lentejas', ing_type: 'Legumbre', description: 'Just lenteja', gluten: true, lactose: false)
Ingredient.create(name: 'Garlic', ing_type: 'Species', description: 'Just garlic', gluten: true, lactose: false)
Ingredient.create(name: 'Milk', ing_type: 'Lactic', description: 'Just milk', gluten: true, lactose: false)
Ingredient.create(name: 'Banana', ing_type: 'Fruit', description: 'Just banana', gluten: true, lactose: false)



# Restaurant.create(user_id: 1, name: 'Mayura', email: 'mayura@food.com', phone: '663453452', address: 'Carrer de Girona, 57', city: 'Barcelona', country: 'Spain', description: 'Mucha carne, much gluten, wow', rest_type: 'Mexican')
# Restaurant.create(user_id: 2,name: 'Daniel Café', email: 'butt@yeah.com', phone: '666999666', address: 'Avinguda Diagonal, 177', city: 'Barcelona', country: 'Spain', description: 'Mucha carne, much gluten, wow', rest_type: 'Normal')
# Restaurant.create(user_id: 3,name: 'Sonora', email: 'sonora@sonora.com', phone: '666999666', address: 'Calle Pamplona, 88', city: 'Barcelona', country: 'Spain', description: 'Mucha carne, much gluten, wow', rest_type: 'Chinese')
# Restaurant.create(user_id: 4,name: 'Can Dende', email: 'candende@gmail.com', phone: '623724829', address: 'Carrer de la Ciutat de Granada, 44', city: 'Barcelona', country: 'Spain', description: 'Very wow, much good', rest_type: 'Mexican')
# Restaurant.create(user_id: 5,name: 'Els Pollos de Llull', email: 'wow@sfood.com', phone: '672340234', address: 'Carrer de Ramon Turró, 13', city: 'Barcelona', country: 'Spain', description: 'Mucha carne, much gluten, wow', rest_type: 'Chinese')
#




Meal.create(name: 'Lasagna', calories: 234, description: 'Filled with beef meat covered with cheese',  meal_type: 'Starter', price: 3, gluten: false, lactose: false)
Meal.create(name: 'Caesar Salad', calories: 3453, description: 'Extremely fresh lettuce and chicken with caesar salad', meal_type: 'Starter', price: 4, gluten: true, lactose: false)
Meal.create(name: 'Cheeseburger', calories: 567, description: 'Yeah, you know, no need for description, right?', meal_type: 'Main', price: 5, gluten: false, lactose: false)
Meal.create(name: 'Four Seasons Pizza', calories: 2342, description: 'Extra mozzarella topping', meal_type: 'Main', price: 3, gluten: false, lactose: false)
Meal.create(name: 'Caesar Salad', calories: 2342, description: 'Extra mozzarella topping', meal_type: 'Main', price: 3, gluten: false, lactose: false)
Meal.create(name: 'Beaf Steak with Roquefort Sauce', calories: 2342, description: 'Extra mozzarella topping', meal_type: 'Main', price: 3, gluten: false, lactose: false)
Meal.create(name: 'Stuffed Mushrooms', calories: 2342, description: 'Extra mozzarella topping', meal_type: 'Main', price: 3, gluten: true, lactose: false)
Meal.create(name: 'Pizza', calories: 2342, description: 'Extra mozzarella topping', meal_type: 'Main', price: 3, gluten: false, lactose: false)
Meal.create(name: 'Pizza', calories: 2342, description: 'Extra mozzarella topping', meal_type: 'Main', price: 3, gluten: false, lactose: false)



# Menu.create(name: 'Holiday special', season: 'Summer', price: 10.99, restaurant_id: 2)
# Menu.create(name: 'Winter meals', season: 'Winter', price: 9.99, restaurant_id: 2)
# Menu.create(name: 'Oktoberfest', season: 'Autumn', price: 12.59, restaurant_id: 2)
# Menu.create(name: 'Spring Menu', season: 'Spring', price: 11.99, restaurant_id: 2)
