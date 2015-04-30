class CompaniesController < ApplicationController
  def show
    @company = Company.find_by(name: params[:q])
    @articles = YahooService.new.articles(@company.ticker_symbol)
  end
  
end
