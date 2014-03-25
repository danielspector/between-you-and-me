class CentersController < ApplicationController
  def show
    @center = Center.find(params[:id])
    @loc1 = @center.points.first
    @loc2 = @center.points.second
    @term = session[:search_term]

    @best_three_hash = @center.yelp_business_nearby(@term)
  end

  def send_text
    line = %w(bro son dog yea sup whoa)
    TWILIO_CLIENT.account.messages.create(
      from: +15036837889, #"+13473826253",
      to: params[:number],
      body: "Hey! We're going to https://www.google.com/maps/place/#{params[:sent_gmaps].split(" ").join("-")}"
    )

    respond_to do |format|
      format.js
    end
  end
end
