class CreateTimecards < ActiveRecord::Migration[5.1]
  def change
    create_table :timecards do |t|
      t.float     :sat_hours,         default: 0.0
      t.integer   :sat_break_hours,   default: 0
      t.integer   :sat_break_minutes, default: 0
      t.datetime  :sat_start
      t.datetime  :sat_end
      t.float     :sun_hours,         default: 0.0
      t.integer   :sun_break_hours,   default: 0
      t.integer   :sun_break_minutes, default: 0
      t.datetime  :sun_start
      t.datetime  :sun_end
      t.float     :mon_hours,         default: 0.0
      t.integer   :mon_break_hours,   default: 0
      t.integer   :mon_break_minutes, default: 0
      t.datetime  :mon_start
      t.datetime  :mon_end
      t.float     :tue_hours,         default: 0.0
      t.integer   :tue_break_hours,   default: 0
      t.integer   :tue_break_minutes, default: 0
      t.datetime  :tue_start
      t.datetime  :tue_end
      t.float     :wed_hours,         default: 0.0
      t.integer   :wed_break_hours,   default: 0
      t.integer   :wed_break_minutes, default: 0
      t.datetime  :wed_start
      t.datetime  :wed_end
      t.float     :thu_hours,         default: 0.0
      t.integer   :thu_break_hours,   default: 0
      t.integer   :thu_break_minutes, default: 0
      t.datetime  :thu_start
      t.datetime  :thu_end
      t.float     :fri_hours,         default: 0.0
      t.integer   :fri_break_hours,   default: 0
      t.integer   :fri_break_minutes, default: 0
      t.datetime  :fri_start
      t.datetime  :fri_end
      t.float :overtime_hours
      t.datetime :end_date
      t.string :stephens_quote
      t.float :total_hours

      t.timestamps
    end
  end
end
