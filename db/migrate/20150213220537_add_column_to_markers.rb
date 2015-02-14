class AddColumnToMarkers < ActiveRecord::Migration
  def change
    add_column :markers, :time_without_traffic, :string
  end
end
