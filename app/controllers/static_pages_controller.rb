class StaticPagesController < ApplicationController

  def home
    @companies = Company.all
    @company_names = Company.all.map(&:name).sort
    @company_scores = Company.scores
  end

end

