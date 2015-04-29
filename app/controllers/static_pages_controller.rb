class StaticPagesController < ApplicationController
  def home
    @company_short ||= params[:company].upcase if params[:company]

    if @company_short == "MSFT"
      @data_points = [1,2,3,4,5,6,7,8,9,1]
    elsif @company_short = "GOOG"
      @data_points = [10, 20, 30, 40, 50, 60, 70, 80, 90, 100]
    else
      @data_points = [1, 2, 5, 78, 56, 34, 23, 56, 78, 90] 
    end

  end

  def landing
  end
end

