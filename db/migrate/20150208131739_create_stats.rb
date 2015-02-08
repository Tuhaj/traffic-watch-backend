class CreateStats < ActiveRecord::Migration
  def change
    create_table :stats do |t|
      t.string :average_time_to_center
      t.integer :city_id

      t.timestamps
    end
  end
end
