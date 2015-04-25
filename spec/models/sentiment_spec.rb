require 'rails_helper'

RSpec.describe Sentiment, type: :model do
  it "is valid with date_and_time, score, and company_id" do
    sentiment = Sentiment.new(date_and_time: DateTime.now, score: 50, company_id: 1)

    expect(sentiment).to be_valid
  end

  it "is not valid without a date_and_time" do
    sentiment = Sentiment.new(date_and_time: nil, score: 50, company_id: 1)
    
    expect(sentiment).not_to be_valid
  end

  it "is not valid without a score" do
    sentiment = Sentiment.new(date_and_time: DateTime.now, score: nil, company_id: 1)

    expect(sentiment).not_to be_valid
  end

  it "is not valid without a company_id" do
    sentiment = Sentiment.new(date_and_time: DateTime.now, score: 50, company_id: nil)

    expect(sentiment).not_to be_valid
  end
end

