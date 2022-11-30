class User < ApplicationRecord
  attr_accessor :old_password

  has_secure_password
  has_many :gratitude_items
  has_many :friendships

  validates :name, presence: true
  validates :email, format: { with: /@/, message: 'Must have an @' }, uniqueness: true

  before_create { generate_token(:auth_token) }

  def self.new_from_hash(user_hash)
    user = User.new user_hash
    user.password_digest = 0
    user
  end

  def has_password?
    password_digest.nil? || password_digest != '0'
  end

  def send_password_reset
    generate_token(:password_reset_token)
    self.password_reset_sent_at = Time.zone.now
    save!
    UserMailer.password_reset(self).deliver
  end

  def generate_token(column)
    begin
      self[column] = SecureRandom.urlsafe_base64
    end while User.exists?(column => self[column])
  end
end
