class CreatePolylines < ActiveRecord::Migration
  def change
    create_table :polylines do |t|
      t.integer :marker_id
      t.timestamps
    end
  end
end
