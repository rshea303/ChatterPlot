class CreateStockPrices < ActiveRecord::Migration
  def change
    create_table :stock_prices do |t|
      t.datetime :date_and_time
      t.decimal :price
      t.references :company, index: true

      t.timestamps null: false
    end
    add_foreign_key :stock_prices, :companies
  end
end
