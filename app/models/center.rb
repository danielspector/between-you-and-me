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

    # response['businesses'].sort_by{|i| i["rating"]}.reverse.each do |business|
    #   business
    # end

    # 1 star: -15,  2 star: -5, 3 star: 5, 4 star: 10, 5 star: 30, weight system
    # >> 5 * 10 #3 star, 10 reviews #=> 50
    # >> 10 * 10 #4 star, 10 reviews #=> 100
    # >> 30 * 10 #5 star, 10 reviews #=> 300
    # >> -3 * 10 #2 star, 10 reviews #=> -50
    # >> -5 * 10 #1 star, 10 reviews #=> -150

    best_business = response['business'].sort_by{ |i| i['rating'] }.last

    business_info = {
      :business_name => best_business['name'],
      :business_address => best_business['location']['display_address'].join(' '),
      :the_venue => Point.create(address: best_business['location']['display_address'].join(' ')),
      :rating_img => best_business['rating_img_url_large'],
      :review_count => best_business['review_count'],
      :the_url => best_business['url'],
      :categories => best_business['categories'].join(', '),
      :venue_image => best_business['image_url']
    }
  end

end
