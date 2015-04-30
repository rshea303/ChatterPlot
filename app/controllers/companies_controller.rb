class CompaniesController < ApplicationController
  def show
    if Company.all.map(&:name).include?(params[:q])
      @company = Company.find_by(name: params[:q])
      @articles = YahooService.new.articles(@company.ticker_symbol)
    else
      redirect_to :back
    end 
  end
end
