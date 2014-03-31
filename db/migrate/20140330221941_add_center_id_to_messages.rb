class AddCenterIdToMessages < ActiveRecord::Migration
  def change
    add_column :messages, :center_id, :integer
  end
end
