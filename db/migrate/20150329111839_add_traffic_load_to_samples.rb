class AddTrafficLoadToSamples < ActiveRecord::Migration
  def change
    add_column :samples, :traffic_load, :integer, default: 100
  end
end
