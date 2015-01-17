class AddsMarkerIndexOnSamples < ActiveRecord::Migration
  def self.up
    add_index :samples, :marker_id
  end

  def self.down
    remove_index :samples, :marker_id
  end
end
