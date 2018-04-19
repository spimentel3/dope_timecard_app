module OrganizationsHelper
  def user_is_part_of_org?(user)
    unless @organization.owner == user or @organization.employees.exists?(user.id)
      false
    end
  end


end
