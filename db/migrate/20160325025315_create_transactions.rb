class CreateTransactions < ActiveRecord::Migration
  def change
    create_table :transactions do |t|
      t.datetime :date
      t.integer :category_id
      t.decimal :amount, precision: 8, scale: 2
    end
  end
end
