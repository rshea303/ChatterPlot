class CompaniesController < ApplicationController
  def show
    company = TickerSymbolService.new(params[:q]).ticker_symbol
    if Company.find_by(name: params[:q])
      @dashboard = DashBoard.new(Company.find_by(name: params[:q]))
    else
      redirect_to :back
    end
  end
end
