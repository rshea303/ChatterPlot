class Company < ActiveRecord::Base

  validates :name, :ticker_symbol, presence: true

  def self.scores
    Company.all.map do |company|
      SentimentAnalysis.new(TwitterService.new.search_by(company.name).take(100).map do |tweet|
        tweet.text
      end.join(' ')).score
    end
  end

  def self.not_legit_symbol(ticker)
    ticker == nil || ticker['symbol'].chars.include?('.')
  end

end
