class StaticPagesController < ApplicationController

  def home
      @companies = Company.order(:name)

    if params[:company_ids]
      @company_names = Company.selected_companies(params[:company_ids])
      @company_scores = Company.scores(@company_names)
    else
      @company_names = Company.limit(5).map(&:name).sort
      @company_scores = Company.scores(@company_names)
    end
  end
end

