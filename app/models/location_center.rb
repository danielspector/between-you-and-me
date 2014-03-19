class LocationCenter < ActiveRecord::Base
  belongs_to :location
  belongs_to :center
end
