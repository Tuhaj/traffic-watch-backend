class CreateSamples < ActiveRecord::Migration
  def change
    create_table :samples do |t|
      t.string :time
      t.integer :marker_id

      t.timestamps
    end
  end
end
