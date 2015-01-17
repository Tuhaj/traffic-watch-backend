class AddColumnToStat < ActiveRecord::Migration
  def change
    add_column :stats, :weighted_mean, :string
  end
end
