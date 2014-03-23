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
      :longitude => longitude,
      :accuracy => 0.5
    )

    response = client.search(request)

    weight_multiplier = {
      0.0 => -20.0,
      0.5 => -17.5,
      1.0 => -15.0,
      1.5 => -8.0,
      2.0 => -5.0,
      2.5 => -2.5,
      3.0 => 5.0,
      3.5 => 7.5,
      4.0 => 10.0,
      4.5 => 15.0,
      5.0 => 21.0
    }

    best_businesses = response['businesses'].sort_by do |i|
      0.2*Math.log(i['review_count']) * weight_multiplier[i['rating']]
    end.last(3)

    lat_long_for_three = best_businesses.map do |business|
      Point.create(address: business['location']['display_address'].join(' '))
    end

    best_businesses.map.each_with_index do |business, index|
      {
        :name => business['name'],
        :address => business['location']['display_address'].join(' '),
        :rating_img => business['rating_img_url_large'],
        :review_count => business['review_count'],
        :the_url => business['url'],
        :categories => business['categories'].join(', '),
        :venue_image => business['image_url'],
        :lat => lat_long_for_three[index].latitude,
        :long => lat_long_for_three[index].longitude
      }
    end
  end

end
