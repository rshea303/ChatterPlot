class Company < ActiveRecord::Base

  validates :name, :ticker_symbol, presence: true

  def self.scores
    Company.all.map do |company|
      SentimentAnalysis.new(TwitterService.new.search_by(company.name).take(100).map do |tweet|
        tweet.text
      end.join(' ')).score
    end
  end

end
