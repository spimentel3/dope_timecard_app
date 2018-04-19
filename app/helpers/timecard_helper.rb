module TimecardHelper

  def get_this_weeks_friday(date)
    # case date.wday
    #   when 0
    #     days_to_add = 5
    #   when 1
    #     days_to_add = 4
    #   when 2
    #     days_to_add = 3
    #   when 3
    #     days_to_add = 2
    #   when 4
    #     days_to_add = 1
    #   when 5
    #     days_to_add = 0
    #   when 6
    #     days_to_add = 6
    # end
    date.to_date + (7 - (date.wday + 2)) % 7
  end
  def get_this_weeks_thursday(date)
    case date.wday
    when 0
      days_to_add = 4
    when 1
      days_to_add = 3
    when 2
      days_to_add = 2
    when 3
      days_to_add = 1
    when 4
      days_to_add = 0
    when 5
      days_to_add = -1
    when 6
      days_to_add = 5
    end
    date.to_date + days_to_add
  end
  def get_this_weeks_wednesday(date)
    case date.wday
    when 0
      days_to_add = 3
    when 1
      days_to_add = 2
    when 2
      days_to_add = 1
    when 3
      days_to_add = 0
    when 4
      days_to_add = -1
    when 5
      days_to_add = -2
    when 6
      days_to_add = 4
    end
    date.to_date + days_to_add
  end
  def get_this_weeks_tuesday(date)
    case date.wday
    when 0
      days_to_add = 2
    when 1
      days_to_add = 1
    when 2
      days_to_add = 0
    when 3
      days_to_add = -1
    when 4
      days_to_add = -2
    when 5
      days_to_add = -3
    when 6
      days_to_add = 3
    end
    date.to_date + days_to_add
  end
  def get_this_weeks_monday(date)
    case date.wday
    when 0
      days_to_add = 1
    when 1
      days_to_add = 0
    when 2
      days_to_add = -1
    when 3
      days_to_add = -2
    when 4
      days_to_add = -3
    when 5
      days_to_add = -4
    when 6
      days_to_add = 2
    end
    date.to_date + days_to_add
  end
  def get_this_weeks_sunday(date)
    case date.wday
    when 0
      days_to_add = 0
    when 1
      days_to_add = -1
    when 2
      days_to_add = -2
    when 3
      days_to_add = -3
    when 4
      days_to_add = -4
    when 5
      days_to_add = -5
    when 6
      days_to_add = 1
    end
    date.to_date + days_to_add
  end
  def get_this_weeks_saturday(date)
    case date.wday
    when 0
      days_to_add = -1
    when 1
      days_to_add = -2
    when 2
      days_to_add = -3
    when 3
      days_to_add = -4
    when 4
      days_to_add = -5
    when 5
      days_to_add = -6
    when 6
      days_to_add = 0
    end
    date.to_date + days_to_add
  end

end
