class CompaniesController < ApplicationController
  def show
    @company = Company.find_by(name: params[:q])
  end
  
end
