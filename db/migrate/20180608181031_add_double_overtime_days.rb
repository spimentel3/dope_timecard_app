class AddDoubleOvertimeDays < ActiveRecord::Migration[5.1]
  def change
    add_column :timecards, :sat_double_overtime, :float, default: 0.0
    add_column :timecards, :sun_double_overtime, :float, default: 0.0
    add_column :timecards, :mon_double_overtime, :float, default: 0.0
    add_column :timecards, :tue_double_overtime, :float, default: 0.0
    add_column :timecards, :wed_double_overtime, :float, default: 0.0
    add_column :timecards, :thu_double_overtime, :float, default: 0.0
    add_column :timecards, :fri_double_overtime, :float, default: 0.0
  end
end
