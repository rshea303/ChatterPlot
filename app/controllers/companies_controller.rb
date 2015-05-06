class CompaniesController < ApplicationController
  def show
    if Company.all.map(&:name).include?(params[:q])
      @company = Company.find_by(name: params[:q])
      @articles = YahooService.new.articles(@company.ticker_symbol)
      @tweets = TwitterService.new.search_by("pepsi").take(20).map do |tweet|
        tweet.text
      end
#      @score = SentimentAnalysis.new(@tweets.join(' ')).score
       @score = 50
      @sentiment_color == "green"   
    else
      redirect_to :back
    end 
  end
end
