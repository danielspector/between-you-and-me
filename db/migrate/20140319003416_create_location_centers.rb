class CreateLocationCenters < ActiveRecord::Migration
  def change
    create_table :location_centers do |t|
      t.integer :location_id
      t.integer :center_id
      t.timestamps
    end
  end
end
