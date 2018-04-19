class CompaniesController < ApplicationController
  before_action :logged_in_user

  def create
    user = User.find_by_name params[:company][:owner]
    @company = Company.new
    if user
      @company = user.owned_companies.build(name: params[:company][:name])
      if @company.save
        flash[:success] = "Company Created"
        redirect_to @current_user
      else
        flash[:danger] = "No company name"
        redirect_to create_company_path
      end
    else
      flash[:danger] = "User not found"
      render 'new'
    end
  end

  def show
  end

  def new
    @company = Company.new
  end

  private

    def logged_in_user
      unless logged_in?
        store_location
        flash[:danger] = "Please Log In"
        redirect_to login_url
      end
    end

end
