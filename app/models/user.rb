class User < ApplicationRecord
  has_secure_password
  has_many :gratitude_items

  validates :name, presence: true
  validates :email, format: {with: /@/, message: 'Must have an @' }, uniqueness: true
end
