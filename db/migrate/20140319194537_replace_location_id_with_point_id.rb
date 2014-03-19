class ReplaceLocationIdWithPointId < ActiveRecord::Migration
  def change
    rename_column :point_centers, :location_id, :point_id
  end
end
