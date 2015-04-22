class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username
      t.string :email
      t.string :uid
      t.string :image_url
      t.string :provider
      t.string :token

      t.timestamps null: false
    end
  end
end
