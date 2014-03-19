class AddAddressToCenters < ActiveRecord::Migration
  def change
    add_column :centers, :address, :string
  end
end
