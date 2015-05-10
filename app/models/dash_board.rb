class DashBoard
  attr_reader :company

  def initialize(company)
    @company = company
  end

  def articles
    company.articles(company)
  end

  def tweets
    company.tweets(company)
  end

  def score
    company.score(company)
  end

  def stock_price
    company.stock_price(company)
  end

  def color
    company.color(score)
  end
  
  def stock_price_color
    company.which_color(company, stock_price)
  end

  def ticker_symbol
    company.ticker_symbol
  end

  def company_name
    company.name
  end
end
