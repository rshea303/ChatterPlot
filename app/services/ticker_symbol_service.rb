require 'open-uri'

class TickerSymbolService
  attr_reader :connection, :parsed_text

  def initialize
    @connection = Faraday.new(url: "http://autoc.finance.yahoo.com")
  end

  def symbols(name) 
    params = { query: name, callback: 'YAHOO.Finance.SymbolSuggest.ssCallback' }
    parse(connection.get('/autoc', params))
  end

  def parse(response)
    start_index = response.body.index('(') + 1
    end_index = response.body.index(')')
    text = response.body.slice(start_index, end_index - start_index)
    @parsed_text = JSON.parse(text)['ResultSet']['Result'].first
  end

end
