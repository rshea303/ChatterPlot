require 'open-uri'

class YahooService
  attr_reader :connection

  def initialize
    @connection = Faraday.new(url: 'http://finance.yahoo.com/rss/2.0')
  end

  def articles(ticker)
    params = { s: ticker, region: 'US', lang: 'en-US' }
    parse(connection.get('headline', params))
  end 

  def parse(response) 
    Nokogiri::XML.parse(response.body) 
  end
end
