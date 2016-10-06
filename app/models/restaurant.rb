class Restaurant < ApplicationRecord
  has_many :menus
  belongs_to :user
  has_one :dailymenu

  validates :name, :presence => true, :uniqueness => true, :length => { :in => 3..20 }
  validates :email, :presence => true, :uniqueness => true
  validates :phone, :presence => true, :uniqueness => true
  validates :city, :presence => true
  validates :country, :presence => true
  validates :address, :presence => true
  validates_format_of :email, :with => /\b[A-Z0-9._%a-z\-]+@(?:[A-Z0-9a-z\-]+\.)+[A-Za-z]{2,4}\z/

end
