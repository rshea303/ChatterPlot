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
      collector << SentimentAnalysis.new(TwitterService.new.search_by(name).take(100).map do |tweet|
        tweet.text
      end.join(' ')).score
    end
  end

  def self.not_legit_symbol(ticker)
    ticker == nil || ticker['symbol'].chars.include?('.')
  end

end
