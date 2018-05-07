class OrganizationsController < ApplicationController
  before_action :logged_in_user
  before_action :correct_user,    only: [:show, :destroy, :notify_users_timecards_are_due, :collect_timecards, :send_invites]

  def new
    @organization = Organization.new
  end

  def create
    @organization = Organization.new(organization_params)
    @organization.owner = User.find(params[:owner_id])

    if @organization.save
      flash[:success] = "Organization Created"
      redirect_to current_user
    else
      @organization.errors.full_messages.each do |error|
        flash[:error] = error
      end

      render 'new'
    end

  end

  def show
    @organization = Organization.find(params[:id])
    @employees = @organization.employees
  end

  def notify_users_timecards_are_due
    organization = Organization.find(params[:organization_id])

    organization.employees.each do |employee|
      organization.send_reminder_email(employee.user)
    end
  end

  def collect_timecards
    organization = Organization.find(params[:organization_id])

    previous_timecard_date = organization.employees.first.user.timecards.last.end_date.to_date

    organization.employees.each do |employee|
      timecard = employee.user.timecards.last
      timecard.active = false
      timecard.save
      timecard = Timecard.new
      timecard.set_up_timecard(previous_timecard_date + 7)
      timecard.save

      timebook_entry = Timebook.new(organization: organization, timecard: timecard, user: employee.user)
      timebook_entry.save
    end

    current_timecard_date = organization.employees.first.user.timecards.last.end_date

    render json: {message: "Collected timecards and issued out new ones", end_date: current_timecard_date.strftime("%m/%d") }

  end

  # noinspection RailsChecklist01
  def send_invites
    @organization = Organization.find(params[:organization_id])
    @invites = params[:emails]
    @successful_invites = []
    @unsuccessful_invites = []
    @invites.each do |email|
      if email == ""
        next
      end
      password = SecureRandom.urlsafe_base64
      user = User.new(email: email, password: password, password_confirmation: password)
      user.needs_to_update_account = true
      user.admin_level = 20
      if user.save
        user.send_invitation_email
        employee = Employee.new(user: user, organization: @organization)
        employee.save

        timecard = Timecard.new
        timecard.set_up_timecard
        timecard.save

        timebook_entry = Timebook.new(organization: @organization, timecard: timecard, user: user)
        timebook_entry.save

        @successful_invites.push(user)
      else
        @unsuccessful_invites.push(user)
      end
    end
  end


  def view_week
    @organization = Organization.find(params[:organization_id])
    date = DateTime.parse(params[:end_date])
    @week_timecards = Timecard.where(id: (Timebook.where(organization_id: @organization).pluck(:timecard_id)), end_date: date)
  end

  def destroy
  end

  private

    def logged_in_user
      unless logged_in?
        store_location
        flash[:danger] = "Please Log In"
        redirect_to login_url
      end
    end

    def correct_user
      if params[:id]
        @organization = Organization.find(params[:id])
      elsif params[:organization_id]
        @organization = Organization.find(params[:organization_id])
      end
      if helpers.user_is_part_of_org?(current_user) == false
        flash[:danger] = "Wrong user access for organization"
        redirect_to(@user)
      end
    end

    def organization_params
      params.require(:organization).permit(:name, :owner_id, :end_date)
    end

end
