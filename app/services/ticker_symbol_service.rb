require 'open-uri'

class TickerSymbolService
  attr_reader :symbol_lookup

  def initialize(name)
    @symbol_lookup = Faraday.new(url: "http://d.yimg.com/autoc.finance.yahoo.com/autoc?query=#{name}&callback=YAHOO.Finance.SymbolSuggest.ssCallback")
  end

  def ticker_symbol
    puts "hello"
  end 
end
