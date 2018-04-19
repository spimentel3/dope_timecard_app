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
    @timecard.sat_break_hours = (params[:timecard][:sat_break_hours] != "")? params[:timecard][:sat_break_hours] : 0
    @timecard.sat_break_minutes = (params[:timecard][:sat_break_minutes] != "")? params[:timecard][:sat_break_minutes] : 0
    @timecard.sat_start = (params[:timecard][:sat_start] != "")? Time.zone.parse("#{params[:timecard][:sat_start]}").utc : @timecard.sat_start
    @timecard.sat_end = (params[:timecard][:sat_end] != "")? Time.zone.parse("#{params[:timecard][:sat_end]}").utc : @timecard.sat_end
    @timecard.sun_break_hours = (params[:timecard][:sun_break_hours] != "")? params[:timecard][:sun_break_hours] : 0
    @timecard.sun_break_minutes = (params[:timecard][:sun_break_minutes] != "")? params[:timecard][:sun_break_minutes] : 0
    @timecard.sun_start = (params[:timecard][:sun_start] != "")? Time.zone.parse("#{params[:timecard][:sun_start]}").utc : @timecard.sun_start
    @timecard.sun_end = (params[:timecard][:sun_end] != "")? Time.zone.parse("#{params[:timecard][:sun_end]}").utc : @timecard.sun_end
    @timecard.mon_break_hours = (params[:timecard][:mon_break_hours] != "")? params[:timecard][:mon_break_hours] : 0
    @timecard.mon_break_minutes = (params[:timecard][:mon_break_minutes] != "")? params[:timecard][:mon_break_minutes] : 0
    @timecard.mon_start = (params[:timecard][:mon_start] != "")? Time.zone.parse("#{params[:timecard][:mon_start]}").utc : @timecard.mon_start
    @timecard.mon_end = (params[:timecard][:mon_end] != "")? Time.zone.parse("#{params[:timecard][:mon_end]}").utc : @timecard.mon_end
    @timecard.tue_break_hours = (params[:timecard][:tue_break_hours] != "")? params[:timecard][:tue_break_hours] : 0
    @timecard.tue_break_minutes = (params[:timecard][:tue_break_minutes] != "")? params[:timecard][:tue_break_minutes] : 0
    @timecard.tue_start = (params[:timecard][:tue_start] != "")? Time.zone.parse("#{params[:timecard][:tue_start]}").utc : @timecard.tue_start
    @timecard.tue_end = (params[:timecard][:tue_end] != "")? Time.zone.parse("#{params[:timecard][:tue_end]}").utc : @timecard.tue_end
    @timecard.wed_break_hours = (params[:timecard][:wed_break_hours] != "")? params[:timecard][:wed_break_hours] : 0
    @timecard.wed_break_minutes = (params[:timecard][:wed_break_minutes] != "")? params[:timecard][:wed_break_minutes] : 0
    @timecard.wed_start = (params[:timecard][:wed_start] != "")? Time.zone.parse("#{params[:timecard][:wed_start]}").utc : @timecard.wed_start
    @timecard.wed_end = (params[:timecard][:wed_end] != "")? Time.zone.parse("#{params[:timecard][:wed_end]}").utc : @timecard.wed_end
    @timecard.thu_break_hours = (params[:timecard][:thu_break_hours] != "")? params[:timecard][:thu_break_hours] : 0
    @timecard.thu_break_minutes = (params[:timecard][:thu_break_minutes] != "")? params[:timecard][:thu_break_minutes] : 0
    @timecard.thu_start = (params[:timecard][:thu_start] != "")? Time.zone.parse("#{params[:timecard][:thu_start]}").utc : @timecard.thu_start
    @timecard.thu_end = (params[:timecard][:thu_end] != "")? Time.zone.parse("#{params[:timecard][:thu_end]}").utc : @timecard.thu_end
    @timecard.fri_break_hours = (params[:timecard][:fri_break_hours] != "")? params[:timecard][:fri_break_hours] : 0
    @timecard.fri_break_minutes = (params[:timecard][:fri_break_minutes] != "")? params[:timecard][:fri_break_minutes] : 0
    @timecard.fri_start = (params[:timecard][:fri_start] != "")? Time.zone.parse("#{params[:timecard][:fri_start]}").utc : @timecard.fri_start
    @timecard.fri_end = (params[:timecard][:fri_end] != "")? Time.zone.parse("#{params[:timecard][:fri_end]}").utc : @timecard.fri_end

    if @timecard.save
      flash[:success] = "Profile Updated"
      redirect_to @current_user
    else
      flash[:danger] = "Problem Updating Timecard"
    end
  end

  def edit
  end

  private

    def timecard_params
      params.require(:timecard).permit(:sat_hours, :sat_break_hours, :sat_break_minutes, :sat_start, :sat_end, :sun_hours, :sun_break_hours, :sun_break_minutes, :sun_start, :sun_end, :mon_hours, :mon_break_hours, :mon_break_minutes, :mon_start, :mon_end, :tue_hours, :tue_break_hours, :tue_break_minutes, :tue_start, :tue_end, :wed_hours, :wed_break_hours, :wed_break_minutes, :wed_start, :wed_end, :thu_hours, :thu_break_hours, :thu_break_minutes, :thu_start, :thu_end, :fri_hours, :fri_break_hours, :fri_break_minutes, :fri_start, :fri_end)
    end

end
