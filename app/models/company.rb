class Company < ActiveRecord::Base
  has_many :sentiments
  has_many :stock_prices
  has_many :articles

  validates :name, :ticker_symbol, presence: true

  def self.scores
    Company.all.map do |company|
      SentimentAnalysis.new(TwitterService.new.search_by(company.name).take(100).map do |tweet|
        tweet.text
      end.join(' ')).score
    end
  end
end
