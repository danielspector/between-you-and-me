class Center < ActiveRecord::Base
  has_many :location_centers
  has_many :locations, through: :location_centers
end
