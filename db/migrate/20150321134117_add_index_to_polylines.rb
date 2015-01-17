class AddIndexToPolylines < ActiveRecord::Migration
  def up
    add_index :polylines, :marker_id
  end

  def down
    remove_index :polylines, :marker_id
  end
end
