class CoursePresetsController < ApplicationController
  # Uses a private method to find the school from the params
  before_action :find_school, only: [:index, :new]

  def index
    @course_presets = CoursePreset.where(school_id: @school)
  end

  def new
    @course_preset = CoursePreset.new
  end

  def create
    course_preset = CoursePreset.new(course_preset_params)
    course_preset.school_id = current_user.school_id

  end

  def update
  end

  def destroy
  end

  private

  # Finds the school through the params
  def find_school
    @school = School.find(params[:school_id])
  end

  def course_preset_params
    params.require(:course_preset).permit(:name, :description)
  end
end
