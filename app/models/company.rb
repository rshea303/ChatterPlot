class Company < ActiveRecord::Base
  validates :name, :ticker_symbol, presence: true
end
