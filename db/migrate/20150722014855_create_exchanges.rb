class CreateExchanges < ActiveRecord::Migration
  def change
    create_table :exchanges do |t|
      t.string :book_owner
      t.string :borrower
      t.string :book

      t.timestamps null: false
    end
  end
end
