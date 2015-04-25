class CreateSentiments < ActiveRecord::Migration
  def change
    create_table :sentiments do |t|
      t.datetime :date_and_time
      t.integer :score
      t.references :company, index: true

      t.timestamps null: false
    end
    add_foreign_key :sentiments, :companies
  end
end
