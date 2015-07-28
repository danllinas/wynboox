class AddCorrectDataTypeToExchange < ActiveRecord::Migration
  def change
    add_column :exchanges, :book_owner_id, :integer
    add_column :exchanges, :borrower_id, :integer
    add_column :exchanges, :book_id, :integer
  end
end
