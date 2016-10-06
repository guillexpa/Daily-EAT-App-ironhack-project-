class CreateRestaurants < ActiveRecord::Migration[5.0]
  def change
    create_table :restaurants do |t|
      t.string :name
      t.string :email
      t.string :phone
      t.string :address
      t.string :city
      t.string :country
      t.string :description
      t.string :rest_type
      t.references :user
      t.timestamps
    end
  end
end
