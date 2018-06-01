class ChangeTimecardBackToFloat < ActiveRecord::Migration[5.1]
  def change
    change_column :timecards, :total_hours, :float, default: 0.0
  end
end
