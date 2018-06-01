class Timecard < ApplicationRecord
  include TimecardHelper

  def set_up_timecard(date = Date.today)

    timecard_friday = get_this_weeks_friday(date)
    timecard_thursday = get_this_weeks_thursday(date)
    timecard_wednesday = get_this_weeks_wednesday(date)
    timecard_tuesday = get_this_weeks_tuesday(date)
    timecard_monday = get_this_weeks_monday(date)
    timecard_saturday = get_this_weeks_saturday(date)
    timecard_sunday = get_this_weeks_sunday(date)

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
    self.active = true

  end

  def total_sat_hours
    self.sat_hours = ((self.sat_end - self.sat_start) / 1.hour).round(2) - self.sat_break_hours - (self.sat_break_minutes / 60.0).round(2)
    if self.sat_hours < 0
      self.sat_hours = 0
    end
    if self.sat_hours > 8.0
      self.sat_overtime = (self.sat_hours - 8.0).round(2)
      self.sat_hours = 8.0
    else
      self.sat_overtime = 0.0
    end
  end
  def total_sun_hours
    self.sun_hours = ((self.sun_end - self.sun_start) / 1.hour).round(2) - self.sun_break_hours - (self.sun_break_minutes / 60.0).round(2)
    if self.sun_hours < 0
      self.sun_hours = 0
    end
    if self.sun_hours > 8.0
      self.sun_overtime = (self.sun_hours - 8.0).round(2)
      self.sun_hours = 8.0
    else
      self.sun_overtime = 0.0
    end
  end
  def total_mon_hours
    self.mon_hours = ((self.mon_end - self.mon_start) / 1.hour).round(2) - self.mon_break_hours - (self.mon_break_minutes / 60.0).round(2)
    if self.mon_hours < 0
      self.mon_hours = 0
    end
    if self.mon_hours > 8.0
      self.mon_overtime = (self.mon_hours - 8.0).round(2)
      self.mon_hours = 8.0
    else
      self.mon_overtime = 0.0
    end
  end
  def total_tue_hours
    self.tue_hours = ((self.tue_end - self.tue_start) / 1.hour).round(2) - self.tue_break_hours - (self.tue_break_minutes / 60.0).round(2)
    if self.tue_hours < 0
      self.tue_hours = 0
    end
    if self.tue_hours > 8.0
      self.tue_overtime = (self.tue_hours - 8.0).round(2)
      self.tue_hours = 8.0
    else
      self.tue_overtime = 0.0
    end
  end
  def total_wed_hours
    self.wed_hours = ((self.wed_end - self.wed_start) / 1.hour).round(2) - self.wed_break_hours - (self.wed_break_minutes / 60.0).round(2)
    if self.wed_hours < 0
      self.wed_hours = 0
    end
    if self.wed_hours > 8.0
      self.wed_overtime = (self.wed_hours - 8.0).round(2)
      self.wed_hours = 8.0
    else
      self.wed_overtime = 0.0
    end
  end
  def total_thu_hours
    self.thu_hours = ((self.thu_end - self.thu_start) / 1.hour).round(2) - self.thu_break_hours - (self.thu_break_minutes / 60.0).round(2)
    if self.thu_hours < 0
      self.thu_hours = 0
    end
    if self.thu_hours > 8.0
      self.thu_overtime = (self.thu_hours - 8.0).round(2)
      self.thu_hours = 8.0
    else
      self.thu_overtime = 0.0
    end
  end
  def total_fri_hours
    self.fri_hours = ((self.fri_end - self.fri_start) / 1.hour).round(2) - self.fri_break_hours - (self.fri_break_minutes / 60.0).round(2)
    if self.fri_hours < 0
      self.fri_hours = 0
    end
    if self.fri_hours > 8.0
      self.fri_overtime = (self.fri_hours - 8.0).round(2)
      self.fri_hours = 8.0
    else
      self.fri_overtime = 0.0
    end
  end

  def total_overtime
    self.overtime_hours = self.sat_overtime + self.sun_overtime + self.mon_overtime + self.tue_overtime + self.wed_overtime + self.thu_overtime + self.fri_overtime
  end

  def total_all_hours
    self.total_sat_hours
    self.total_sun_hours
    self.total_mon_hours
    self.total_tue_hours
    self.total_wed_hours
    self.total_thu_hours
    self.total_fri_hours
    self.total_overtime
    self.total_hours = (self.sat_hours + self.sun_hours + self.mon_hours + self.tue_hours + self.wed_hours + self.thu_hours + self.fri_hours).round(2)
    if self.total_hours > 40.0
      difference = self.total_hours - 40.0
      self.total_hours = 40.0
      self.overtime_hours += difference
    end
  end

  def get_owner
    Timebook.find_by(timecard_id: self.id).user
  end

end