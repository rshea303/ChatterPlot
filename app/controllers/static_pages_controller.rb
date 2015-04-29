class StaticPagesController < ApplicationController
  def home
    @companies = Company.all
    @company_names = Company.all.map(&:name)
    @company_scores = Company.scores
  end

  def landing
  end
end

