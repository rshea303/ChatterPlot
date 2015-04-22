class FixUserColumnName < ActiveRecord::Migration
  def change
    rename_column :users, :username, :nickname
  end
end
