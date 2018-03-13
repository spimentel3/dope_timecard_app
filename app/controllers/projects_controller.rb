class ProjectsController < ApplicationController
  before_action :correct_user_for_company,      only: [:new, :create]
  before_action :correct_user_for_project,      only: [:show]

  def new
    @project = Project.new
    # store_location
  end

  def show
    @project = Project.find(params[:id])
  end

  def create
    @user_id = current_user.id
    @project = Project.new(project_params)
    @project.project_manager ||= User.find @user_id
    @project.part_of ||= Company.find params[:company_id]
    if @project.save
      flash[:success] = "Created Project: #{@project.name}"
      redirect_to current_user
    else
      render 'new', company_id: params[:company_id], project_manager_id: params[:project_manager_id]
    end
  end

  def update
    @project = Project.find(params[:id])
    if @project.update_attributes(project_params)
      flash[:success] = "Project Updated"
      render 'show'
    else
      flash[:danger] = @project.errors.full_messages
      render 'show'
    end
  end

  def destroy
  end

  private

    def project_params
      params.require(:project).permit(:name, :description, :project_manager, :part_of)
    end

    def correct_user_for_company
      @user = current_user
      @company = Company.find params[:company_id]
      if @user.owned_companies.exists?(@company.id) == false
        flash[:danger] = "Error in finding company or wrong user creating company"
        redirect_to(current_user)
      end
    end

    def correct_user_for_project
      @user = current_user
      @project = Project.find params[:id]
      if helpers.user_is_part_of_project?(@user) == false
        flash[:danger] = "Wrong user access for project, please try something else"
        redirect_to(current_user)
      end
    end

end
