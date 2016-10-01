class Meal < ApplicationRecord
  has_many :recipes
  has_many :ingredients, through: :recipes
  has_and_belongs_to_many :menus
  
  after_initialize :set_default_lactose, :if => :new_record?
  after_initialize :set_default_gluten, :if => :new_record?
  validates :name, :presence => true
  validates :price, :presence => true
  validates :calories, :presence => true
  validates :description, :presence => true


  def set_default_gluten
    unless self.gluten
      self.gluten = true
    end
  end

  def set_default_lactose
    unless self.lactose
      self.lactose = true
    end
  end
end
