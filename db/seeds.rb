# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)



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

Restaurant.create(name: 'Sonora', email: 'sonora@sonora.com', phone: '666999666', address: 'Calle Pamplona, 88', city: 'Barcelona', country: 'Spain', description: 'Mucha carne, much gluten, wow')


Meal.create(name: 'Lasagna', calories: 234, description: 'Filled with beef meat covered with cheese',  meal_type: 'First', price: 3, gluten: false, lactose: false)
Meal.create(name: 'Caesar Salad', calories: 3453, description: 'Extremely fresh lettuce and chicken with caesar salad', meal_type: 'First', price: 4, gluten: true, lactose: false)
Meal.create(name: 'Cheeseburger', calories: 567, description: 'Yeah, you know, no need for description, right?', meal_type: 'Second', price: 5, gluten: false, lactose: false)
Meal.create(name: 'Pizza', calories: 2342, description: 'Extra mozzarella topping', meal_type: 'Second', price: 3, gluten: false, lactose: false)

Menu.create(name: 'Holiday special', season: 'Summer', price: 10.99, restaurant_id: 1)
Menu.create(name: 'Winter meals', season: 'Winter', price: 9.99, restaurant_id: 1)
Menu.create(name: 'Oktoberfest', season: 'Autumn', price: 12.59, restaurant_id: 1)
Menu.create(name: 'Spring Menu', season: 'Spring', price: 11.99, restaurant_id: 1)
