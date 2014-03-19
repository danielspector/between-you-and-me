class RenameLocationsToPoints < ActiveRecord::Migration
  def change
    rename_table :locations, :points
  end
end
