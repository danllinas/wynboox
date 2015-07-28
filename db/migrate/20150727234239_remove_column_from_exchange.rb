class RemoveColumnFromExchange < ActiveRecord::Migration
  def change
    remove_column :exchanges, :book_owner, :string
    remove_column :exchanges, :borrower, :string
    remove_column :exchanges, :book, :string
  end
end
