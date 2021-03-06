class Point < ActiveRecord::Base
  geocoded_by :address
  after_validation :geocode
  has_many :point_centers
  has_many :centers, through: :point_centers

  def self.find_between(add1, add2)
    lat_long = Geocoder::Calculations.geographic_center([add1, add2])
    center = Center.new(latitude: lat_long[0], longitude: lat_long[1])
    add1.centers << center
    add2.centers << center
    center
  end

end
