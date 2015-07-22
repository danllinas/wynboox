class User < ActiveRecord::Base
  has_many :books
  has_many :exchanges
  has_secure_password
end
