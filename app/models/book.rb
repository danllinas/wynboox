class Book < ActiveRecord::Base
  belongs_to :user
  has_one :exchange
end
