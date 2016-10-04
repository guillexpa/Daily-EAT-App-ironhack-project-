class Menu < ApplicationRecord
  has_and_belongs_to_many :meals
  belongs_to :restaurant
end
