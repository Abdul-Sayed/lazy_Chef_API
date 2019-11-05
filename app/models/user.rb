class User < ApplicationRecord
  has_secure_password
  # validates :username, unique: true
  # validates_uniqueness_of :username
  has_and_belongs_to_many :saved_recipes
end
