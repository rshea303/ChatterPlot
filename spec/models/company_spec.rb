require 'rails_helper'

RSpec.describe Company, type: :model do
  it "is valid with name and ticker symbol" do
    company = Company.new(name: "google", ticker_symbol: "GOOG")

    expect(company).to be_valid
  end

  it "is not valid without a name" do
    company = Company.new(name: nil, ticker_symbol: "GOOG")

    expect(company).not_to be_valid
  end


  it "is not valid without a ticker symbol" do
    company = Company.new(name: "google", ticker_symbol: nil)

    expect(company).not_to be_valid
  end

end
