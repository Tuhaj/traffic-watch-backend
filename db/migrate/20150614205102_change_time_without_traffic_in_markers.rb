class ChangeTimeWithoutTrafficInMarkers < ActiveRecord::Migration

  def up
    change_column :markers, :time_without_traffic,
      'integer USING CAST(time_without_traffic AS integer)'
  end

  def down
    change_column :markers, :time_without_traffic, :string
  end
end
