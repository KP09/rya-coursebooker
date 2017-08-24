module ApplicationHelper
  # Helper to check if the current user is an application admin
  def current_user_is_application_admin?
    current_user.admin? ? true : false
  end

  # Helper to check if the the current user is a school admin
  def current_user_is_school_admin?
    current_user.admin_profile ? true : false
  end
end
