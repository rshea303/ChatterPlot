class Company < ActiveRecord::Base
  has_many :sentiments
  has_many :stock_prices
  has_many :articles

  validates :name, :ticker_symbol, presence: true

  def self.scores
    Company.all.map do |company|
      company.sentiments.first.score
    end
  end
end
