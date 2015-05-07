class StockInfo
  attr_reader :stock_info

  def initialize(ticker_symbol)
    @stock_info = StockQuote::Stock.quote(ticker_symbol) 
  end

  def bid
    stock_info.bid
  end

  def open
    stock_info.open
  end

  def last_trade_price_only
    stock_info.last_trade_price_only
  end
end
