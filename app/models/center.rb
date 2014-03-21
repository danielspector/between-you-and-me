class Center < ActiveRecord::Base
  has_many :point_centers
  has_many :points, through: :point_centers

  reverse_geocoded_by :latitude, :longitude
  after_validation :reverse_geocode


  def yelp_business_nearby(term)

    client = Yelp::Client.new
    request = GeoPoint.new(
      :term => term,
      :latitude => latitude,
      :longitude => longitude
    )

    response = client.search(request)
    business_info = {
      :business_name => response['businesses'].sort_by{|i| i["rating"]}.last['name'],
      :business_address => response['businesses'].sort_by{|i| i["rating"]}.last['location']['display_address'].join(' '),
      :the_venue => Point.create(address:  response['businesses'].sort_by{|i| i["rating"]}.last['location']['display_address'].join(' ')),
      :rating_img => response['businesses'].sort_by{|i| i["rating"]}.last['rating_img_url_large'],
      :review_count => response['businesses'].sort_by{|i| i["rating"]}.last['review_count'],
      :the_url => response['businesses'].sort_by{|i| i["rating"]}.last['url'],
      :categories => response['businesses'].sort_by{|i| i["rating"]}.last['categories'].join(', '),
      :venue_image => response['businesses'].sort_by{|i| i["rating"]}.last['image_url']    
    }
  end

end
