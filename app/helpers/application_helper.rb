module ApplicationHelper
  # Helper to check if the current user is an admin
  def user_is_admin?
    current_user.admin? ? true : false
  end
end
