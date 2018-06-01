module UsersHelper
  def gravatar_for(user, size)
    gravatar_id = Digest::MD5::hexdigest(user.email.downcase)
    "https://secure.gravatar.com/avatar/#{gravatar_id}?s=#{size}"
  end

  def has_root_access?
    @current_user.admin_level <= 9
  end

  def has_company_access?
    @current_user.admin_level <= 19
  end

  def has_user_access?
    @current_user.admin_level <= 99
  end

  def has_guest_access?
    @current_user.admin_level == 100
  end

  def is_root?
    @current_user.admin_level == 1
  end

  def is_company_owner?
    @current_user.admin_level == 10
  end

  def is_company_co_owner?
    @current_user.admin_level == 11
  end

  def is_company_user?
    @current_user.admin_level  == 20
  end

  def is_guest?
    @current_user.admin_level  == 100
  end

end
