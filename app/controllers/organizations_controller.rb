class OrganizationsController < ApplicationController
  before_action :logged_in_user
  before_action :correct_user,    only: [:show, :destroy]

  def new
    @organization = Organization.new
  end

  def create
    @organization = Organization.new(organization_params)
    @organization.owner_id = params[:owner_id]

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
  end

  # noinspection RailsChecklist01
  def send_invites
    @organization = Organization.find(params[:organization_id])
    @invites = params[:emails]
    @successful_invites = []
    @unsuccessful_invites = []
    @invites.each do |email|
      user = User.new(email: email, password: "theia123", password_confirmation: "theia123")
      if user.save
        user.send_activation_email
        employee = Employee.new(user: user, organization: @organization)
        employee.save
        @successful_invites.push(user)
      else
        @unsuccessful_invites.push(user)
      end
    end
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
      @user = current_user
      @organization = Organization.find(params[:id])
      if helpers.user_is_part_of_org?(@user) == false
        flash[:danger] = "Wrong user access for organization, please try something else"
        redirect_to(@user)
      end
    end

    def organization_params
      params.require(:organization).permit(:name, :owner_id)
    end

end
