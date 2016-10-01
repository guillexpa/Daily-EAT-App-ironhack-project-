class CreateMenus < ActiveRecord::Migration[5.0]
  def change
    create_table :menus do |t|
      t.string :name
      t.string :season
      t.float :price
      t.timestamps
    end
  end
end
