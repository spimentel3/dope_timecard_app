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

  def calculate_hours(day)
    day[:hours] = (((day[:end] - day[:start]) / 1.hour) - day[:break_hours] - (day[:break_minutes] / 60.0)).round(2)
    if day[:hours] < 0
      day[:hours] = 0
    end

    # This handles if the employee works more than 8 hours a day
    if day[:hours] > 8.0
      day[:overtime] = (day[:hours] - 8.0).round(2)
      day[:hours] = 8.0
      if day[:overtime] > 4.0
        day[:double_overtime] = (day[:overtime] - 4.0).round(2)
        day[:overtime] = 4.0
      else
        day[:double_overtime] = 0.0
      end
    else
      day[:overtime] = 0.0
      day[:double_overtime] = 0.0
    end
  end

  def total_sat_hours
    day = { hours: self.sat_hours, end: self.sat_end, start: self.sat_start, break_hours: self.sat_break_hours, break_minutes: self.sat_break_minutes, overtime: self.sat_overtime, double_overtime: self.sat_double_overtime }
    calculate_hours day
    self.sat_hours = day[:hours]
    self.sat_overtime = day[:overtime]
    self.sat_double_overtime = day[:double_overtime]
  end
  def total_sun_hours
    day = { hours: self.sun_hours, end: self.sun_end, start: self.sun_start, break_hours: self.sun_break_hours, break_minutes: self.sun_break_minutes, overtime: self.sun_overtime, double_overtime: self.sun_double_overtime }
    calculate_hours day
    self.sun_hours = day[:hours]
    self.sun_overtime = day[:overtime]
    self.sun_double_overtime = day[:double_overtime]
  end
  def total_mon_hours
    day = { hours: self.mon_hours, end: self.mon_end, start: self.mon_start, break_hours: self.mon_break_hours, break_minutes: self.mon_break_minutes, overtime: self.mon_overtime, double_overtime: self.mon_double_overtime }
    calculate_hours day
    self.mon_hours = day[:hours]
    self.mon_overtime = day[:overtime]
    self.mon_double_overtime = day[:double_overtime]
  end
  def total_tue_hours
    day = { hours: self.tue_hours, end: self.tue_end, start: self.tue_start, break_hours: self.tue_break_hours, break_minutes: self.tue_break_minutes, overtime: self.tue_overtime, double_overtime: self.tue_double_overtime }
    calculate_hours day
    self.tue_hours = day[:hours]
    self.tue_overtime = day[:overtime]
    self.tue_double_overtime = day[:double_overtime]
  end
  def total_wed_hours
    day = { hours: self.wed_hours, end: self.wed_end, start: self.wed_start, break_hours: self.wed_break_hours, break_minutes: self.wed_break_minutes, overtime: self.wed_overtime, double_overtime: self.wed_double_overtime }
    calculate_hours day
    self.wed_hours = day[:hours]
    self.wed_overtime = day[:overtime]
    self.wed_double_overtime = day[:double_overtime]
  end
  def total_thu_hours
    day = { hours: self.thu_hours, end: self.thu_end, start: self.thu_start, break_hours: self.thu_break_hours, break_minutes: self.thu_break_minutes, overtime: self.thu_overtime, double_overtime: self.thu_double_overtime }
    calculate_hours day
    self.thu_hours = day[:hours]
    self.thu_overtime = day[:overtime]
    self.thu_double_overtime = day[:double_overtime]
  end
  def total_fri_hours
    day = { hours: self.fri_hours, end: self.fri_end, start: self.fri_start, break_hours: self.fri_break_hours, break_minutes: self.fri_break_minutes, overtime: self.fri_overtime, double_overtime: self.fri_double_overtime }
    calculate_hours day
    self.fri_hours = day[:hours]
    self.fri_overtime = day[:overtime]
    self.fri_double_overtime = day[:double_overtime]
  end

  def total_overtime
    self.overtime_hours = self.sat_overtime + self.sun_overtime + self.mon_overtime + self.tue_overtime + self.wed_overtime + self.thu_overtime + self.fri_overtime
    self.double_overtime = self.sat_double_overtime + self.sun_double_overtime + self.mon_double_overtime + self.tue_double_overtime + self.wed_double_overtime + self.thu_double_overtime + self.fri_double_overtime
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

    # This is if the employee works over 40 hours in one week, different from 8 hours a day rule.
    if self.total_hours > 40.0
      difference = self.total_hours - 40.0
      self.overtime_hours += difference
      self.total_hours = 40.0
    end
  end

  def get_owner
    Timebook.find_by(timecard_id: self.id).user
  end

end