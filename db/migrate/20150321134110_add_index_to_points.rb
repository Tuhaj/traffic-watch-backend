class AddIndexToPoints < ActiveRecord::Migration
  def up
    add_index :points, :polyline_id
  end

  def down
    remove_index :points, :polyline_id
  end
end
