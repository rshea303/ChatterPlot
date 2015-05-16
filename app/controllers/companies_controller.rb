class CompaniesController < ApplicationController
  def show
    ticker_symbol = TickerSymbolService.new.symbols(params[:q])['symbol']
    name = TickerSymbolService.new.symbols(params[:q])['name']
    @dashboard = DashBoard.new(ticker_symbol, name)
  end
end
