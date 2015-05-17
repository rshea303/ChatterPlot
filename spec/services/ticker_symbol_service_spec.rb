require 'rails_helper'

describe "ticker symbol service api" do

  let(:service) { TickerSymbolService.new }

  it "identifies company stock symbol and name" do
    VCR.use_cassette('company info') do
      expect(service.symbols('exxon')['symbol']).to eq('XOM') 
      expect(service.symbols('exxon')['name']).to eq('Exxon Mobil Corporation')
    end
  end
end
