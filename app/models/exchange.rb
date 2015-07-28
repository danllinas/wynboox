class Exchange < ActiveRecord::Base
  belongs_to :owner, class_name: "User", primary_key: 'book_owner'
  belongs_to :borrower, class_name: "User", primary_key: 'borrower'
  belongs_to :book

end
