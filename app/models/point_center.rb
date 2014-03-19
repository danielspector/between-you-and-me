class PointCenter < ActiveRecord::Base
  belongs_to :point
  belongs_to :center
end
