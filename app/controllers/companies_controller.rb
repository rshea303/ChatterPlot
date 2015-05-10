class CompaniesController < ApplicationController
  def show
    if Company.all.map(&:name).include?(params[:q])
      company      = Company.find_by(name: params[:q])
      @company     = company
      @articles    = company.articles(company)
      @tweets      = company.tweets(company)
      @score       = company.score(company)
      @stock_price = company.stock_price(company)
      @color       = company.color(@score)
      @sp_color    = company.which_color(company, @stock_price)
    else
      redirect_to :back
    end
  end

end
