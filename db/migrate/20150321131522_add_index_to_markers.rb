class AddIndexToMarkers < ActiveRecord::Migration
  def up
    add_index :markers, :city_id
  end

  def down
    remove_index :markers, :city_id
  end
end
