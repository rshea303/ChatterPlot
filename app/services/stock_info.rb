class StockInfo
  attr_reader :stock_info

  def initialize(ticker_symbol)
    @stock_info = StockQuote::Stock.quote(ticker_symbol) 
  end

  def bid
    stock_info.bid
  end
end
