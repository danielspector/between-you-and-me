class PointsController < ApplicationController

  def index
  end

  def new
  end

  def create
    @add1 = Point.create(address: params[:point][:address1])
    @add2 = Point.create(address: params[:point][:address2])
    @term = params[:point][:term]
    @center = Point.find_between(@add1, @add2)

    respond_to do |format|
      format.js {
        render :json => {
          :center => @center,
          :address1 => @add1,
          :address2 => @add2,
          :term => @term
        }
      }
    end
  end

  def yelp_business_nearby

    client = Yelp::Client.new

    request = GeoPoint.new(
      :term => params[:center][:term],
      :latitude => params[:center][:latitude],
      :longitude => params[:center][:longitude]
    )

    response = client.search(request)

    business_address = response['businesses'].first['location']['display_address'].join(' ')

    lat_long = Point.create(address: business_address)
    lat = lat_long.latitude
    long = lat_long.longitude

    respond_to do |format|
      format.js {
        render :json => {
          :name => response['businesses'].first['name'],
          :location => response['businesses'].first['location'],
          :lat => lat,
          :long => long
        }
      }
    end
  end

  # 37.788022, -122.399797


  def show

  end
end
