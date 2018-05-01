class AddLockToTimecards < ActiveRecord::Migration[5.1]
  def change
    add_column :timecards, :locked, :boolean, default: false
  end
end
