class StaticPagesController < ApplicationController
  def home
    @tweets = TwitterService.new.search_by("pepsi").take(5).map do |tweet|
      tweet.text
    end

    @companies = Company.all
    @company_names = Company.all.map(&:name)
    @company_scores = Company.scores
  end

  def landing
  end
end

