class Center < ActiveRecord::Base
  has_many :location_centers
  has_many :locations, through: :location_centers

  reverse_geocoded_by :latitude, :longitude
  after_validation :reverse_geocode
end
