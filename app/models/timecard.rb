class Timecard < ApplicationRecord
  include TimecardHelper

  def set_up_timecard

    timecard_friday = get_this_weeks_friday(Date.today)
    timecard_thursday = get_this_weeks_thursday(Date.today)
    timecard_wednesday = get_this_weeks_wednesday(Date.today)
    timecard_tuesday = get_this_weeks_tuesday(Date.today)
    timecard_monday = get_this_weeks_monday(Date.today)
    timecard_saturday = get_this_weeks_saturday(Date.today)
    timecard_sunday = get_this_weeks_sunday(Date.today)

    self.end_date = Time.utc(timecard_friday.year, timecard_friday.month, timecard_friday.day, 13)

    self.fri_start = Time.utc(timecard_friday.year, timecard_friday.month, timecard_friday.day, 0)
    self.fri_end = Time.utc(timecard_friday.year, timecard_friday.month, timecard_friday.day, 0)
    self.thu_start = Time.utc(timecard_thursday.year, timecard_thursday.month, timecard_thursday.day, 0)
    self.thu_end = Time.utc(timecard_thursday.year, timecard_thursday.month, timecard_thursday.day, 0)
    self.wed_start = Time.utc(timecard_wednesday.year, timecard_wednesday.month, timecard_wednesday.day, 0)
    self.wed_end = Time.utc(timecard_wednesday.year, timecard_wednesday.month, timecard_wednesday.day, 0)
    self.tue_start = Time.utc(timecard_tuesday.year, timecard_tuesday.month, timecard_tuesday.day, 0)
    self.tue_end = Time.utc(timecard_tuesday.year, timecard_tuesday.month, timecard_tuesday.day, 0)
    self.mon_start = Time.utc(timecard_monday.year, timecard_monday.month, timecard_monday.day, 0)
    self.mon_end = Time.utc(timecard_monday.year, timecard_monday.month, timecard_monday.day, 0)
    self.sun_start = Time.utc(timecard_sunday.year, timecard_sunday.month, timecard_sunday.day, 0)
    self.sun_end = Time.utc(timecard_sunday.year, timecard_sunday.month, timecard_sunday.day, 0)
    self.sat_start = Time.utc(timecard_saturday.year, timecard_saturday.month, timecard_saturday.day, 0)
    self.sat_end = Time.utc(timecard_saturday.year, timecard_saturday.month, timecard_saturday.day, 0)

  end

end