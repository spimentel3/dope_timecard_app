class AddOvertimeToTimecards < ActiveRecord::Migration[5.1]
  def change
    add_column :timecards, :overtime, :integer, default: 0
  end
end
