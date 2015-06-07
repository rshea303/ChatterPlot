class DashBoard
  attr_reader :ticker_symbol, :name, :search_name

  def initialize(ticker_symbol, name, search_name)
    @ticker_symbol = ticker_symbol
    @name          = name
    @search_name   = search_name
  end

  def articles
    YahooService.new.articles(ticker_symbol)
  end

  def tweets
    TwitterService.new.search_by("#{search_name}").take(100)
  end

  def score
    company_tweets = tweets.map {|tweet| tweet.text}
    SentimentAnalysis.new(company_tweets.join(' ')).score
  end

  def stock_price
    StockInfo.new(ticker_symbol).last_trade_price_only
  end

  def color
    sentiment_color(score)
  end
  
  def stock_price_color
    which_color
  end

  def company_ticker_symbol
    ticker_symbol
  end

  def company_name
    name
  end

  def open
    StockInfo.new(ticker_symbol).open
  end

  def year_high
    StockInfo.new(ticker_symbol).year_high
  end

  def year_low
    StockInfo.new(ticker_symbol).year_low
  end

  def low
    StockInfo.new(ticker_symbol).low
  end

  def high
    StockInfo.new(ticker_symbol).high
  end
  
  def sentiment_color(score)
    if score >= 50
      '#6EBF60'
    else
      '#D1002D'
    end
  end

  def which_color
    if stock_price > StockInfo.new(ticker_symbol).open
      '#6EBF60'
    else
      '#D1002D'
    end
  end
end
