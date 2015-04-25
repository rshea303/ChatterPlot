require 'rails_helper'

RSpec.describe StockPrice, type: :model do
  it "is valid with date_and_time, price, and company_id" do
    stock_price = StockPrice.new(date_and_time: DateTime.now, price: 5000, company_id: 1)

    expect(stock_price).to be_valid
  end

  it "is not valid without a date_and_time" do
    stock_price = StockPrice.new(date_and_time: nil, price: 5000, company_id: 1)

    expect(stock_price).not_to be_valid
  end

  it "is not valid without a price" do
    stock_price = StockPrice.new(date_and_time: DateTime.now, price: nil, company_id: 1)

    expect(stock_price).not_to be_valid
  end

  it "is not valid without a company_id" do
    stock_price = StockPrice.new(date_and_time: DateTime.now, price: 5000, company_id: nil)

    expect(stock_price).not_to be_valid
  end
end
