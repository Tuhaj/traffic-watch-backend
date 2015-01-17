class CreatePoints < ActiveRecord::Migration
  def change
    create_table :points do |t|
      t.string :lat
      t.string :lng
      t.integer :polyline_id

      t.timestamps
    end
  end
end
