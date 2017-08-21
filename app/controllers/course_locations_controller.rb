class CourseLocationsController < ApplicationController
  # Authenticate the user before any actions inside this controller
  before_action :authenticate_user!

  # Uses a private method to find the course_location from the params
  before_action :find_course_location, only: [:show, :edit, :update, :destroy]

  # Uses a private method to find the school from the params
  before_action :find_school, only: [:index, :show, :new, :create, :edit, :update, :destroy]

  def index
    @course_locations = CourseLocation.where(school_id: @school)
    # Use the Gmaps4rails gem to construct the markers
    locations_with_lat_long = @course_locations.reject { |location| location.latitude == nil || location.longitude == nil }
    @coordinates_hash = Gmaps4rails.build_markers(locations_with_lat_long) do |course_location, marker|
      if course_location.latitude != nil && course_location.longitude != nil
        marker.lat course_location.latitude
        marker.lng course_location.longitude
      end
      # marker.infowindow render_to_string(partial: "/flats/map_box", locals: { flat: flat })
    end
  end

  def show
  end

  def new
    @course_location = CourseLocation.new
  end

  def create
    @course_location = CourseLocation.new(course_location_params)
    @course_location.school_id = @school.id
    if @course_location.save
      redirect_to school_course_location_path(@school, @course_location)
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @course_location.update(course_location_params)
      redirect_to school_course_location_path(@school, @course_location)
    else
      render :edit
    end
  end

  def destroy
    if @course_location.destroy
      redirect_to school_course_locations_path(@school)
    else
      render :index
    end
  end

  private

  def find_course_location
    @course_location = CourseLocation.find(params[:id])
  end

  def find_school
    @school = School.find(params[:school_id])
  end

  def course_location_params
    params.require(:course_location).permit(:name, :description, :address)
  end
end
