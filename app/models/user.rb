class User < ActiveRecord::Base
  has_many :books
  has_many :exchanges
  has_secure_password
  before_save {email.downcase!}
  validates :username, presence: true, length: { maximum: 50}, uniqueness: true
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 140 }, format: {with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false }
  validates :password_digest, presence: true, length: { minimum: 6 }

end
