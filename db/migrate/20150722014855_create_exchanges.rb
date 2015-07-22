class CreateExchanges < ActiveRecord::Migration
  def change
    create_table :exchanges do |t|
      t.string :giver
      t.string :taker
      t.string :book
      t.string :status

      t.timestamps null: false
    end
  end
end
