class CreateTimecards < ActiveRecord::Migration[5.1]
  def change
    create_table :timecards do |t|
      t.float     :sat_hours,                 default: 0.0
      t.integer   :sat_break_hours,           default: 0
      t.boolean   :sat_break_hours_is_set,    default: false
      t.integer   :sat_break_minutes,         default: 0
      t.boolean   :sat_break_minutes_is_set,  default: false
      t.datetime  :sat_start
      t.boolean   :sat_start_is_set,          default: false
      t.datetime  :sat_end
      t.boolean   :sat_end_is_set,            default: false
      t.float     :sun_hours,                 default: 0.0
      t.integer   :sun_break_hours,           default: 0
      t.boolean   :sun_break_hours_is_set,    default: false
      t.integer   :sun_break_minutes,         default: 0
      t.boolean   :sun_break_minutes_is_set,  default: false
      t.datetime  :sun_start
      t.boolean   :sun_start_is_set,          default: false
      t.datetime  :sun_end
      t.boolean   :sun_end_is_set,            default: false
      t.float     :mon_hours,                 default: 0.0
      t.integer   :mon_break_hours,           default: 0
      t.boolean   :mon_break_hours_is_set,    default: false
      t.integer   :mon_break_minutes,         default: 0
      t.boolean   :mon_break_minutes_is_set,  default: false
      t.datetime  :mon_start
      t.boolean   :mon_start_is_set,          default: false
      t.datetime  :mon_end
      t.boolean   :mon_end_is_set,            default: false
      t.float     :tue_hours,                 default: 0.0
      t.integer   :tue_break_hours,           default: 0
      t.boolean   :tue_break_hours_is_set,    default: false
      t.integer   :tue_break_minutes,         default: 0
      t.boolean   :tue_break_minutes_is_set,  default: false
      t.datetime  :tue_start
      t.boolean   :tue_start_is_set,          default: false
      t.datetime  :tue_end
      t.boolean   :tue_end_is_set,            default: false
      t.float     :wed_hours,                 default: 0.0
      t.integer   :wed_break_hours,           default: 0
      t.boolean   :wed_break_hours_is_set,    default: false
      t.integer   :wed_break_minutes,         default: 0
      t.boolean   :wed_break_minutes_is_set,  default: false
      t.datetime  :wed_start
      t.boolean   :wed_start_is_set,          default: false
      t.datetime  :wed_end
      t.boolean   :wed_end_is_set,            default: false
      t.float     :wed_hours,                 default: 0.0
      t.integer   :wed_break_hours,           default: 0
      t.boolean   :wed_break_hours_is_set,    default: false
      t.integer   :wed_break_minutes,         default: 0
      t.boolean   :wed_break_minutes_is_set,  default: false
      t.datetime  :wed_start
      t.boolean   :wed_start_is_set,          default: false
      t.datetime  :wed_end
      t.boolean   :wed_end_is_set,            default: false
      t.float     :thu_hours,                 default: 0.0
      t.integer   :thu_break_hours,           default: 0
      t.boolean   :thu_break_hours_is_set,    default: false
      t.integer   :thu_break_minutes,         default: 0
      t.boolean   :thu_break_minutes_is_set,  default: false
      t.datetime  :thu_start
      t.boolean   :thu_start_is_set,          default: false
      t.datetime  :thu_end
      t.boolean   :thu_end_is_set,            default: false
      t.float     :fri_hours,                 default: 0.0
      t.integer   :fri_break_hours,           default: 0
      t.boolean   :fri_break_hours_is_set,    default: false
      t.integer   :fri_break_minutes,         default: 0
      t.boolean   :fri_break_minutes_is_set,  default: false
      t.datetime  :fri_start
      t.boolean   :fri_start_is_set,          default: false
      t.datetime  :fri_end
      t.boolean   :fri_end_is_set,            default: false
      t.float :overtime_hours
      t.datetime :end_date
      t.string :stephens_quote
      t.float :total_hours

      t.timestamps
    end
  end
end
