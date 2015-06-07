class CompaniesController < ApplicationController
  def show
    ticker = TickerSymbolService.new.symbols(params[:q])
    if Company.not_legit_symbol(ticker)
      flash[:alert] = "#{params[:q].downcase.capitalize} not found. Please check your spelling or enter a different company name."
      redirect_to :back 
    else
      ticker_symbol = TickerSymbolService.new.symbols(params[:q])['symbol']
      name = TickerSymbolService.new.symbols(params[:q])['name']
      search_name = params[:q]
      @dashboard = DashBoard.new(ticker_symbol, name, search_name)
    end
  end
end
