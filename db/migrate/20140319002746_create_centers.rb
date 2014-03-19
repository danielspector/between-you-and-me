class CreateCenters < ActiveRecord::Migration
  def change
    create_table :centers do |t|
      t.float :latitude
      t.float :longitude
      t.timestamps
    end
  end
end
