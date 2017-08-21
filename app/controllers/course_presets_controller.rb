class CoursePresetsController < ApplicationController
  # Authenticate the user before any actions inside this controller
  before_action :authenticate_user!

  # Uses a private method to find the course_preset from the params
  before_action :find_course_preset, only: [:show, :edit, :update, :destroy]

  # Uses a private method to find the school from the params
  before_action :find_school, only: [:index, :show, :new, :create, :edit, :update, :destroy]

  def index
    @course_presets = CoursePreset.where(school_id: @school)
  end

  def show
  end

  def new
    @course_preset = CoursePreset.new
  end

  def create
    @course_preset = CoursePreset.new(course_preset_params)
    @course_preset.school_id = @school.id
    if @course_preset.save
      redirect_to school_course_preset_path(@school, @course_preset)
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @course_preset.update(course_preset_params)
      redirect_to school_course_preset_path(@school, @course_preset)
    else
      render :edit
    end
  end

  def destroy
    if @course_preset.destroy
      redirect_to school_course_presets_path(@school)
    else
      render :index
    end
  end

  private

  # Finds the course preset through the params
  def find_course_preset
    @course_preset = CoursePreset.find(params[:id])
  end

  # Finds the school through the params
  def find_school
    @school = School.find(params[:school_id])
  end

  # Only allow these params when creating or updating a CoursePreset
  def course_preset_params
    params.require(:course_preset).permit(:name, :description)
  end
end
