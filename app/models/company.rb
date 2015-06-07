class Company < ActiveRecord::Base

  validates :name, :ticker_symbol, presence: true

  def self.selected_companies(checked_companies)
    collector = []
    checked_companies.each do |name, id|
      collector << name
    end
    collector 
  end

  def self.scores(company_names)
    collector = []
    company_names.each do |name|
      company_tweets = TwitterService.new.search_by(name).take(100).map {|tweet| tweet.text}
      company_tweet = company_tweets.join(' ')
      collector << SentimentAnalysis.new(company_tweet).score
    end
    collector
  end

  def self.not_legit_symbol(ticker)
    ticker == nil || ticker['symbol'].chars.include?('.')
  end

end
