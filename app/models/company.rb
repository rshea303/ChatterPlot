class Company < ActiveRecord::Base
  has_many :sentiments
  has_many :stock_prices

  validates :name, :ticker_symbol, presence: true
end
