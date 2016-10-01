class CreateRecipes < ActiveRecord::Migration[5.0]
  def change
    create_table :recipes do |t|
      t.references :ingredient
      t.references :meal
      t.timestamps
    end
  end
end
