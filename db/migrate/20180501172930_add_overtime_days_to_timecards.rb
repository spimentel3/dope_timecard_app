class AddOvertimeDaysToTimecards < ActiveRecord::Migration[5.1]
  def change
    add_column :timecards, :sat_overtime, :float, default: 0.0
    add_column :timecards, :sun_overtime, :float, default: 0.0
    add_column :timecards, :mon_overtime, :float, default: 0.0
    add_column :timecards, :tue_overtime, :float, default: 0.0
    add_column :timecards, :wed_overtime, :float, default: 0.0
    add_column :timecards, :thu_overtime, :float, default: 0.0
    add_column :timecards, :fri_overtime, :float, default: 0.0

  end
end
