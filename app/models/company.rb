class Company < ActiveRecord::Base

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
    TwitterService.new.search_by("#{company.name}").take(5)
    #TwitterService.new.search_by(company.name).take(100).map(&:text)
  end

  def score(company)
    SentimentAnalysis.new(tweets(company).join(' ')).score
  end

  def stock_price(company)
    StockInfo.new(company.ticker_symbol).last_trade_price_only
  end

  def which_color(company, stock_price)
    if stock_price > StockInfo.new(company.ticker_symbol).open
      'green'
    else
      'red'
    end
  end

  def color(score)
    if score >= 50
      'green'
    else
      'red'
    end
  end


end
