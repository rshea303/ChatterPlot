class Seed

  def call
    sentiments
  end

  def companies
    [ 
    Company.create(name: "google", ticker_symbol: "GOOG"),
    Company.create(name: "apple", ticker_symbol: "APPL"),
    Company.create(name: "yahoo", ticker_symbol: "YHOO"),
    Company.create(name: "facebook", ticker_symbol: "FB"),
    Company.create(name: "ibm", ticker_symbol: "IBM")
    ]
  end

  def sentiments
    companies.each do |company|
      sentiment = company.sentiments.create(date_and_time: DateTime.now, score: rand(25..75))
      puts "Company: #{company.name} (#{company.ticker_symbol})  --- Sentiment: date_and_time: #{sentiment.date_and_time} score: #{sentiment.score}"
      stock_price = company.stock_prices.create(date_and_time: DateTime.now, price: rand(1000..50000))
      puts "Company: #{company.name} (#{company.ticker_symbol})  --- Stock Price: date_and_time: #{stock_price.date_and_time} score: #{stock_price.price}"
    end
  end

  def self.call
    new.call
  end

end

Seed.call
