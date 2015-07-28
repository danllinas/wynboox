class User < ActiveRecord::Base
  attr_accessor :remember_token
  has_many :books, dependent: :destroy
  has_many :exchanges, dependent: :destroy
  has_secure_password
  before_save {email.downcase!}
  validates :username, presence: true, length: { maximum: 50}, uniqueness: true
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 140 }, format: {with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false }
  validates :password, presence: true, length: { minimum: 6 }

  #returns the hash digest of the given string
  def User.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                  BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end

  #returns a random token
  def User.new_token
    SecureRandom.urlsafe_base64
  end

  #rmembers a user int he database for use in persitent sessions.
  def remember
    self.remember_token = User.new_token
    update_attribute(:remember_digest, User.digest(remember_token))
  end

  #returns true if the given toekn matches the digest
  def authenticated?(remember_token)
    return false if remember_digest.nil?
    BCrypt::Password.new(remember_digest).is_password?(remember_token)
  end

  #forget a user
  def forget
    update_attribute(:remember_digest, nil)
  end

end
