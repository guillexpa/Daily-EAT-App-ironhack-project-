class CreateJoinTableMenusMeals < ActiveRecord::Migration[5.0]
  def change
    create_join_table :menus, :meals do |t|
      t.index [:menu_id, :meal_id]
      t.index [:meal_id, :menu_id]
    end
  end
end
