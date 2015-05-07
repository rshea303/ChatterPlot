class CompaniesController < ApplicationController
  def show
    if Company.all.map(&:name).include?(params[:q])
      company      = Company.find_by(name: params[:q])
      @company     = company
      @articles    = company.articles(company)
      @tweets      = company.tweets(company)
      @score       = company.score(company)
      @stock_price = company.stock_price(company)
      @color       = what_color(@score)
      @sp_color    = which_color(company, @stock_price)
    else
      redirect_to :back
    end
  end

  def which_color(company, stock_price)
    if stock_price > StockInfo.new(company.ticker_symbol).open
      'green'
    else
      'red'
    end
  end

  def what_color(score)
    if score >= 50
      'green'
    else
      'red'
    end
  end
end
