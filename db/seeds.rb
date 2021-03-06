class Seed

  def call
    companies
  end

  def companies
    [ 
    Company.create(name: "google", ticker_symbol: "GOOG"),
    Company.create(name: "apple", ticker_symbol: "AAPL"),
    Company.create(name: "yahoo", ticker_symbol: "YHOO"),
    Company.create(name: "facebook", ticker_symbol: "FB"),
    Company.create(name: "ibm", ticker_symbol: "IBM"),
    Company.create(name: "microsoft", ticker_symbol: "MSFT"),
    Company.create(name: "amazon", ticker_symbol: "AMZN"),
    Company.create(name: "walmart", ticker_symbol: "WMT"),
    Company.create(name: "exxon", ticker_symbol: "XOM"),
    Company.create(name: "pepsi", ticker_symbol: "PEP"),
    Company.create(name: "nike", ticker_symbol: "NKE"),
    Company.create(name: "sears", ticker_symbol: "SHLD"),
    Company.create(name: "texas instruments", ticker_symbol: "TXN"),
    Company.create(name: "general motors", ticker_symbol: "GM"),
    Company.create(name: "general mills", ticker_symbol: "GIS"),
    Company.create(name: "bank of america", ticker_symbol: "BAC"),
    Company.create(name: "citigroup", ticker_symbol: "C"),
    Company.create(name: "ebay", ticker_symbol: "EBAY"),
    Company.create(name: "ford motor company", ticker_symbol: "F"),
    Company.create(name: "johnson & johnson", ticker_symbol: "JNJ"),
    Company.create(name: "coca-cola", ticker_symbol: "KO")
    ]
  end

  def self.call
    new.call
  end

end

Seed.call
