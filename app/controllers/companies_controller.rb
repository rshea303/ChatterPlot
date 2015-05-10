class CompaniesController < ApplicationController
  def show
    if Company.all.map(&:name).include?(params[:q])
      @dashboard = DashBoard.new(Company.find_by(name: params[:q]))
    else
      redirect_to :back
    end
  end
end
