require 'open-uri'

class YahooService
  attr_reader :connection, :data, :article_info

  def initialize
    @connection = Faraday.new(url: 'http://finance.yahoo.com/rss/2.0')
  end

  def articles(ticker)
    params = { s: ticker, region: 'US', lang: 'en-US' }
    article_data(parse(connection.get('headline', params)))
  end 

  def parse(response) 
    Nokogiri::XML.parse(response.body) 
  end

  def article_data(data)
    @article_info = data.xpath("//item").map do |item|
       { 
        "title"       => item.xpath("title").text,
        "link"        => item.xpath("link").text,
        "description" => item.xpath("description").text
       }
    end
  end
end
