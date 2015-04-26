class Company < ActiveRecord::Base
  has_many :sentiments
  has_many :stock_prices
  has_many :articles

  validates :name, :ticker_symbol, presence: true
end
