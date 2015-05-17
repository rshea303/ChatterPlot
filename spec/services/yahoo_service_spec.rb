require 'rails_helper'

describe "yahoo rss news feed" do

  let(:service) { YahooService.new }  
  
  it "selects articles" do
    VCR.use_cassette('articles') do
      articles = service.articles("XOM")

      expect(articles.first["title"]).to eq("S&P 500 Index Futures Trading Flat")
      expect(articles.first["link"]).to eq("http://us.rd.yahoo.com/finance/news/rss/story/*http://finance.yahoo.com/news/p-500-index-futures-trading-144721098.html")
    end
  end
end
