class CentersController < ApplicationController
  def show
    @center = Center.find(params[:id])
    @loc1 = @center.points.first
    @loc2 = @center.points.second
    @term = session[:search_term]

    @best_three_hash = @center.yelp_business_nearby(@term)
  end


end
