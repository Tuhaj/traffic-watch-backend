class CreateMarkers < ActiveRecord::Migration
  def change
    create_table :markers do |t|
      t.string :lat
      t.string :lng

      t.timestamps
    end
  end
end
