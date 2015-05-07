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

  def articles(company)
    YahooService.new.articles(company.ticker_symbol)
  end

  def tweets(company)
    TwitterService.new.search_by(company.name).take(100).map(&:text)
  end

  def score(company)
    SentimentAnalysis.new(tweets(company).join(' ')).score
  end

  def stock_price(company)
    StockInfo.new(company.ticker_symbol).last_trade_price_only
  end

end
