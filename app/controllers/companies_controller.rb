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

=begin
    if Company.all.map(&:name).include?(params[:q])
      @company = Company.find_by(name: params[:q])
      @articles = YahooService.new.articles(@company.ticker_symbol)
      @tweets = TwitterService.new.search_by(@company.name).take(100).map do |tweet|
        tweet.text
      end
       @score = SentimentAnalysis.new(@tweets.join(' ')).score
       @stock_price = StockInfo.new(@company.ticker_symbol).bid
       @color = what_color(@score)
    else
      redirect_to :back
    end 
  end
=end
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
