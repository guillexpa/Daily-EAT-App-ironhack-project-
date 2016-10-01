class CreateMeals < ActiveRecord::Migration[5.0]
  def change
    create_table :meals do |t|
      t.string :name
      t.float :price
      t.integer :calories
      t.string :description
      t.boolean :gluten
      t.boolean :lactose

      t.timestamps
    end
  end
end
