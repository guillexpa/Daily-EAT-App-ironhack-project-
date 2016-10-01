class CreateIngredients < ActiveRecord::Migration[5.0]
  def change
    create_table :ingredients do |t|
      t.string :name
      t.string :ing_type
      t.string :description
      t.boolean :lactose
      t.boolean :gluten

      t.timestamps
    end
  end
end
