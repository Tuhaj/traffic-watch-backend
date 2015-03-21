class AddIndexToStats < ActiveRecord::Migration
  def up
    add_index :stats, :city_id
  end

  def down
    remove_index :stats, :city_id
  end
end
