class UsersController < ApplicationController
  before_action :logged_in_user,          only: [:index, :edit, :update, :show]
  before_action :has_admin_access,        only: [:index]
  before_action :needs_to_update_account, only: [:show]
  before_action :correct_user,            only: [:edit, :update, :show]
  before_action :new_account,             only: [:show]

  def show
    @user = User.find(params[:id])
    # @users = User.all
    @owned_organizations = @user.owned_organizations.all
    @timecard = @user.timecards.last

  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    @user.admin_level = 10
    if @user.save
      @user.send_activation_email
      flash[:info] = "Please check your email to activate your account."
      redirect_to login_url
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    @user.needs_to_update_account = false
    if @user.update_attributes(user_params)
      flash[:success] = "Profile Updated"
      redirect_to @user
    else
      render 'edit'
    end
  end

  private
    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end

    def logged_in_user
      unless logged_in?
        store_location
        flash[:danger] = "Please Log In"
        redirect_to login_url
      end
    end

    def needs_to_update_account
      if @current_user.needs_to_update_account
        redirect_to edit_user_path
      end
    end

    def correct_user
      @user = User.find(params[:id])
      redirect_to(@current_user) unless current_user?(@user) or has_admin_access
    end

    def new_account
      @user = User.find(params[:id])
      if @user.name == nil
        flash[:danger] = "Please update account info"
        render 'edit'
      end
    end

    def has_admin_access
      @current_user.admin_level == 1
    end
end
