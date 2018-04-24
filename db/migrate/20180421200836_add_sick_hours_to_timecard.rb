class AddSickHoursToTimecard < ActiveRecord::Migration[5.1]
  def change
    add_column :timecards, :sick_hours, :int, default: 0
  end
end
