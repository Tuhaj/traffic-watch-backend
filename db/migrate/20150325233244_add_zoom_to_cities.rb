class AddZoomToCities < ActiveRecord::Migration
  def change
    add_column :cities, :zoom, :integer, default: 10
  end
end
