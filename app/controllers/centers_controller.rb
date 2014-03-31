class CentersController < ApplicationController
  def show
    @center = Center.find(params[:id])
    @loc1 = @center.points[0]
    @loc2 = @center.points[1]
    @term = session[:search_term]
    @best_three_hash = @center.yelp_business_nearby(@term)
    @messages = @center.messages
    @message = @center.messages.new
  end

  def send_text
    to_address = params[:sent_gmaps].split(" ").join("+")
    from_address = params[:sent_from_add].split(" ").join("-")
    TWILIO_CLIENT.account.messages.create(
      from: ENV['TWILIO_NUM'],
      to: params[:number],
      body: "Hey! We're going to https://www.google.com/maps/dir/#{from_address}/#{to_address}"
    )

    respond_to do |format|
      format.js
    end
  end

  def destroy
    @center = Center.find(params[:id])
    @center.messages.destroy_all
    respond_to do |format|
      format.js
    end
  end
end
