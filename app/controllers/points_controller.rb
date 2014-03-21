class PointsController < ApplicationController

  def index
  end

  def new
  end

  def create
    @add1 = Point.create(address: params[:point][:address1])
    @add2 = Point.create(address: params[:point][:address2])
    @center = Point.find_between(@add1, @add2)

    respond_to do |format|
      format.js {
        render :json => {
          :center => @center,
          :address1 => @add1,
          :address2 => @add2,
        }
      }
    end
  end

  def yelp_business_nearby

    client = Yelp::Client.new

    request = GeoPoint.new(
      :term => params[:search][:term],
      :latitude => params[:center][:latitude],
      :longitude => params[:center][:longitude]
    )

    response = client.search(request)

    business_name = response['businesses'].first['name']
    business_address = response['businesses'].first['location']['display_address'].join(' ')
    the_venue = Point.create(address: business_address)
    rating_img = response['businesses'].first['rating_img_url_large']
    review_count = response['businesses'].first['review_count']
    the_url = response['businesses'].first['url']
    categories = response['businesses'].first['categories'].join(', ')
    venue_image = response['businesses'].first['image_url']
    open_or_closed = response['businesses'].first["is_closed"] ? "<p style='color:red;'>Closed</p>" : "<p style='color:green;'>Open</p>"

    respond_to do |format|
      format.js {
        render :json => {
          :name => business_name,
          :location => business_address,
          :lat => the_venue.latitude,
          :long => the_venue.longitude,
          :rating_img => rating_img,
          :review_count => review_count,
          :the_url => the_url,
          :categories => categories,
          :venue_image => venue_image,
          :open_or_closed => open_or_closed
        }
      }
    end
  end

end
