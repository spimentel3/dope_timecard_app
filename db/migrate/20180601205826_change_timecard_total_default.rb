class ChangeTimecardTotalDefault < ActiveRecord::Migration[5.1]
  def change
    change_column :timecards, :total_hours, :integer, default: 0.0
  end
end
