class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.string :source
      t.string :title
      t.references :company, index: true

      t.timestamps null: false
    end
    add_foreign_key :articles, :companies
  end
end
