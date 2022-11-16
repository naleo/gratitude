class User < ApplicationRecord
  
  attr_accessor :old_password
  
  has_secure_password
  has_many :gratitude_items

  validates :name, presence: true
  validates :email, format: {with: /@/, message: 'Must have an @' }, uniqueness: true
  
  before_create { generate_token(:auth_token) }
  
  def self.new_from_hash(user_hash)
    user = User.new user_hash
    user.password_digest = 0
    user
  end
  
  def has_password?
    self.password_digest.nil? || self.password_digest != '0'
  end
  
  def generate_token(column)
    begin
      self[column] = SecureRandom.urlsafe_base64
    end while User.exists?(column => self[column])
  end
end
