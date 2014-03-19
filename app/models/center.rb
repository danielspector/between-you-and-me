class Center < ActiveRecord::Base
  has_many :point_centers
  has_many :points, through: :point_centers

  reverse_geocoded_by :latitude, :longitude
  after_validation :reverse_geocode
end
