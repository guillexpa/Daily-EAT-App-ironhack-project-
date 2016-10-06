class User < ApplicationRecord
  has_secure_password
  has_one :restaurant
  # after_initialize :set_default_role, :if => :new_record?
  validates :username, :presence => true, :uniqueness => true, :length => { :in => 3..20 }
  validates :email, :presence => true, :uniqueness => true
  validates_format_of :email, :with => /\b[A-Z0-9._%a-z\-]+@(?:[A-Z0-9a-z\-]+\.)+[A-Za-z]{2,4}\z/
  validates :password, :confirmation => true
  validates_length_of :password, :in => 6..20, :on => :create

  # def set_default_role
  #   unless self.role
  #     self.role = :user
  #   end
  # end

end
