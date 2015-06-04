class StaticPagesController < ApplicationController

  def home
      @companies = Company.all

    if params[:company_ids]
      @company_names = Company.selected_companies(params[:company_ids])
      @company_scores = Company.scores(@company_names)
    else
      @company_names = Company.all.map(&:name).sort
      @company_scores = Company.scores
    end
  end
end

