class CompaniesController < ApplicationController
  def show
    ticker = TickerSymbolService.new.symbols(params[:q])
    if ticker == nil || ticker['symbol'].chars.include?('.')
      redirect_to :back 
    else
      ticker_symbol = TickerSymbolService.new.symbols(params[:q])['symbol']
      name = TickerSymbolService.new.symbols(params[:q])['name']
      @dashboard = DashBoard.new(ticker_symbol, name)
    end
  end
end
