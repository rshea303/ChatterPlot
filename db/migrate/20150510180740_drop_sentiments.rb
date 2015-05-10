class DropSentiments < ActiveRecord::Migration
  def change
    drop_table :sentiments
  end
end
