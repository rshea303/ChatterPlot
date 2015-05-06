class StaticPagesController < ApplicationController
  def home
    @tweets = TwitterService.new.search_by("pepsi").take(5).map do |tweet|
      tweet.text
    end

    # grab tweets
    # run tweet text thru sentiment analysis
    # normalize the average score (* 100)
    # pass it to the graph
    @companies = Company.all
    @company_names = Company.all.map(&:name)
    @company_scores = Company.scores
  end

  def landing
  end
end

