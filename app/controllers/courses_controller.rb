class CoursesController < ApplicationController
  # Authenticate the user before any actions inside this controller
  before_action :authenticate_user!

  def index
    @courses = Course.where(school_id: current_user.admin_profile.school.id)
  end
end
