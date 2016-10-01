# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20161001215615) do

  create_table "ingredients", force: :cascade do |t|
    t.string   "name"
    t.string   "ing_type"
    t.string   "description"
    t.boolean  "lactose"
    t.boolean  "gluten"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "meals", force: :cascade do |t|
    t.string   "name"
    t.float    "price"
    t.integer  "calories"
    t.string   "description"
    t.boolean  "gluten"
    t.boolean  "lactose"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "meals_menus", id: false, force: :cascade do |t|
    t.integer "menu_id", null: false
    t.integer "meal_id", null: false
    t.index ["meal_id", "menu_id"], name: "index_meals_menus_on_meal_id_and_menu_id"
    t.index ["menu_id", "meal_id"], name: "index_meals_menus_on_menu_id_and_meal_id"
  end

  create_table "menus", force: :cascade do |t|
    t.string   "name"
    t.string   "season"
    t.float    "price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "recipes", force: :cascade do |t|
    t.integer  "ingredient_id"
    t.integer  "meal_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["ingredient_id"], name: "index_recipes_on_ingredient_id"
    t.index ["meal_id"], name: "index_recipes_on_meal_id"
  end

end
