class TimecardController < ApplicationController
  def new
  end

  def show
  end

  def create
  end

  # noinspection RailsChecklist01
  def update
    @timecard = Timecard.find(params[:id])

    if params[:timecard][:sat_start] != ""
      @timecard.sat_start = Time.zone.parse("#{params[:timecard][:sat_start]}").utc
      @timecard.sat_start_is_set = true
    end
    if params[:timecard][:sat_end] != ""
      @timecard.sat_end = Time.zone.parse("#{params[:timecard][:sat_end]}").utc
      @timecard.sat_end_is_set = true
    end
    if params[:timecard][:sat_break_hours] != ""
      @timecard.sat_break_hours = params[:timecard][:sat_break_hours]
      @timecard.sat_break_hours_is_set = true
    end
    if params[:timecard][:sat_break_minutes] != ""
      @timecard.sat_break_minutes = params[:timecard][:sat_break_minutes]
      @timecard.sat_break_minutes_is_set = true
    end

    if params[:timecard][:sun_start] != ""
      @timecard.sun_start = Time.zone.parse("#{params[:timecard][:sun_start]}").utc
      @timecard.sun_start_is_set = true
    end
    if params[:timecard][:sun_end] != ""
      @timecard.sun_end = Time.zone.parse("#{params[:timecard][:sun_end]}").utc
      @timecard.sun_end_is_set = true
    end
    if params[:timecard][:sun_break_hours] != ""
      @timecard.sun_break_hours = params[:timecard][:sun_break_hours]
      @timecard.sun_break_hours_is_set = true
    end
    if params[:timecard][:sun_break_minutes] != ""
      @timecard.sun_break_minutes = params[:timecard][:sun_break_minutes]
      @timecard.sun_break_minutes_is_set = true
    end

    if params[:timecard][:mon_start] != ""
      @timecard.mon_start = Time.zone.parse("#{params[:timecard][:mon_start]}").utc
      @timecard.mon_start_is_set = true
    end
    if params[:timecard][:mon_end] != ""
      @timecard.mon_end = Time.zone.parse("#{params[:timecard][:mon_end]}").utc
      @timecard.mon_end_is_set = true
    end
    if params[:timecard][:mon_break_hours] != ""
      @timecard.mon_break_hours = params[:timecard][:mon_break_hours]
      @timecard.mon_break_hours_is_set = true
    end
    if params[:timecard][:mon_break_minutes] != ""
      @timecard.mon_break_minutes = params[:timecard][:mon_break_minutes]
      @timecard.mon_break_minutes_is_set = true
    end

    if params[:timecard][:tue_start] != ""
      @timecard.tue_start = Time.zone.parse("#{params[:timecard][:tue_start]}").utc
      @timecard.tue_start_is_set = true
    end
    if params[:timecard][:tue_end] != ""
      @timecard.tue_end = Time.zone.parse("#{params[:timecard][:tue_end]}").utc
      @timecard.tue_end_is_set = true
    end
    if params[:timecard][:tue_break_hours] != ""
      @timecard.tue_break_hours = params[:timecard][:tue_break_hours]
      @timecard.tue_break_hours_is_set = true
    end
    if params[:timecard][:tue_break_minutes] != ""
      @timecard.tue_break_minutes = params[:timecard][:tue_break_minutes]
      @timecard.tue_break_minutes_is_set = true
    end

    if params[:timecard][:wed_start] != ""
      @timecard.wed_start = Time.zone.parse("#{params[:timecard][:wed_start]}").utc
      @timecard.wed_start_is_set = true
    end
    if params[:timecard][:wed_end] != ""
      @timecard.wed_end = Time.zone.parse("#{params[:timecard][:wed_end]}").utc
      @timecard.wed_end_is_set = true
    end
    if params[:timecard][:wed_break_hours] != ""
      @timecard.wed_break_hours = params[:timecard][:wed_break_hours]
      @timecard.wed_break_hours_is_set = true
    end
    if params[:timecard][:wed_break_minutes] != ""
      @timecard.wed_break_minutes = params[:timecard][:wed_break_minutes]
      @timecard.wed_break_minutes_is_set = true
    end

    if params[:timecard][:thu_start] != ""
      @timecard.thu_start = Time.zone.parse("#{params[:timecard][:thu_start]}").utc
      @timecard.thu_start_is_set = true
    end
    if params[:timecard][:thu_end] != ""
      @timecard.thu_end = Time.zone.parse("#{params[:timecard][:thu_end]}").utc
      @timecard.thu_end_is_set = true
    end
    if params[:timecard][:thu_break_hours] != ""
      @timecard.thu_break_hours = params[:timecard][:thu_break_hours]
      @timecard.thu_break_hours_is_set = true
    end
    if params[:timecard][:thu_break_minutes] != ""
      @timecard.thu_break_minutes = params[:timecard][:thu_break_minutes]
      @timecard.thu_break_minutes_is_set = true
    end

    if params[:timecard][:fri_start] != ""
      @timecard.fri_start = Time.zone.parse("#{params[:timecard][:fri_start]}").utc
      @timecard.fri_start_is_set = true
    end
    if params[:timecard][:fri_end] != ""
      @timecard.fri_end = Time.zone.parse("#{params[:timecard][:fri_end]}").utc
      @timecard.fri_end_is_set = true
    end
    if params[:timecard][:fri_break_hours] != ""
      @timecard.fri_break_hours = params[:timecard][:fri_break_hours]
      @timecard.fri_break_hours_is_set = true
    end
    if params[:timecard][:fri_break_minutes] != ""
      @timecard.fri_break_minutes = params[:timecard][:fri_break_minutes]
      @timecard.fri_break_minutes_is_set = true
    end

    @timecard.gather_all_hours
    @timecard.total_hours

    @timecard.save

    render json: {total_hours: @timecard.total_hours}

  end

  def edit
  end

  private

    def timecard_params
      params.require(:timecard).permit(:sat_hours, :sat_break_hours, :sat_break_minutes, :sat_start, :sat_end, :sun_hours, :sun_break_hours, :sun_break_minutes, :sun_start, :sun_end, :mon_hours, :mon_break_hours, :mon_break_minutes, :mon_start, :mon_end, :tue_hours, :tue_break_hours, :tue_break_minutes, :tue_start, :tue_end, :wed_hours, :wed_break_hours, :wed_break_minutes, :wed_start, :wed_end, :thu_hours, :thu_break_hours, :thu_break_minutes, :thu_start, :thu_end, :fri_hours, :fri_break_hours, :fri_break_minutes, :fri_start, :fri_end)
    end

end
