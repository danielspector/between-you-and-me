class CentersController < ApplicationController
  def show
    @center = Center.find(params[:id])
    @loc1 = @center.points.first
    @loc2 = @center.points.second
    @term = session[:search_term]

    response = @center.yelp_business_nearby(@term)

    @business_name = response[:business_name]
    @business_address = response[:business_address]
    @the_venue = response[:the_venue]
    @rating_img = response[:rating_img]
    @review_count = response[:review_count]
    @the_url = response[:the_url]
    @categories = response[:categories]
    @venue_image = response[:venue_image]
  end


end
