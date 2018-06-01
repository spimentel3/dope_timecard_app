module OrganizationsHelper
  def user_is_part_of_org?(user)
    if @organization.owner == user or @organization.employees.exists?(user_id: user.id) or @organization.comanagers.exists?(user_id: user.id)
      true
    else
      false
    end
  end
end
