class Seed

  def call
    articles
  end

  def companies
    [ 
    Company.create(name: "google", ticker_symbol: "GOOG"),
    Company.create(name: "apple", ticker_symbol: "APPL"),
    Company.create(name: "yahoo", ticker_symbol: "YHOO"),
    Company.create(name: "facebook", ticker_symbol: "FB"),
    Company.create(name: "ibm", ticker_symbol: "IBM"),
    Company.create(name: "microsoft", ticker_symbol: "MSFT"),
    Company.create(name: "amazon", ticker_symbol: "AMZN"),
    Company.create(name: "pepsi", ticker_symbol: "PEP"),
    Company.create(name: "walmart", ticker_symbol: "WMT"),
    Company.create(name: "exxon", ticker_symbol: "XOM")
    ]
  end

  def articles
    companies.each do |company|
      3.times do |i|
        company.articles.create(source: "twitter", title: "Twitter article #{i} for #{company.name}")
        company.articles.create(source: "yahoo", title: "Yahoo! article #{i} for #{company.name}")
        company.articles.create(source: "marketwatch", title: "Marketwatch article #{i} for #{company.name}")
      end
      company.sentiments.create(score: rand(0..100), date_and_time: DateTime.now)
    end
  end

  def self.call
    new.call
  end

end

Seed.call
