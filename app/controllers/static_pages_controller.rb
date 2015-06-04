class StaticPagesController < ApplicationController

  def home
    binding.pry
    @companies = Company.all
    @company_names = Company.all.map(&:name).sort
    @company_scores = Company.scores
  end

end

