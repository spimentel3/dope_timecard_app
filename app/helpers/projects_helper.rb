module ProjectsHelper

  def user_is_part_of_project?(user)
    unless @project.project_manager == user
      return false
    end
  end

end
