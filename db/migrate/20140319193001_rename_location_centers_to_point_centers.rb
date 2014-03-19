class RenameLocationCentersToPointCenters < ActiveRecord::Migration
  def change
    rename_table :location_centers, :point_centers
  end
end
