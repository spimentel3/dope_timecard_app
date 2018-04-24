class TimebookController < ApplicationController
  before_action :logged_in_user

  def new
  end

  def show
  end

  def create
  end

  def update
  end

  def edit
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
