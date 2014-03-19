

class LocationsController < ApplicationController

  def index
  end

  def new
  end

  def create
    @add1 = Location.create(address: params[:location][:address1])
    @add2 = Location.create(address: params[:location][:address2])
    @center = Location.find_between(@add1, @add2)

    respond_to do |format|
      format.js {
        render :json => {
          :center => @center ,
          :address1 => @add1,
          :address2 => @add2
        }
      }
    end
  end

  def yelp_business_nearby

    client = Yelp::Client.new

    request = GeoPoint.new(
      :term => "coffee",
      :latitude => 37.788022,
      :longitude => -122.399797
    )

    response = client.search(request)

    binding.pry
  end

  def show

  end
end
