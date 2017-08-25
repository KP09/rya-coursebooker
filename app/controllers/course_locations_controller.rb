class CourseLocationsController < ApplicationController
  # Authenticate the user before any actions inside this controller
  before_action :authenticate_user!

  # Uses a private method to find the course_location from the params
  before_action :find_course_location, only: [:show, :edit, :update, :destroy]

  # Uses a private method to find the school from the params
  before_action :find_school, only: [:index, :show, :new, :create, :edit, :update, :destroy]

  def index
    @course_location = CourseLocation.new
    @course_locations = CourseLocation.where(school_id: @school)
    # Reject locations where either the lat or long is nil
    locations_with_lat_long = @course_locations.reject { |location| location.latitude == nil || location.longitude == nil }
    # Use the Gmaps4rails gem to construct the markers
    # @coordinates_hash = Gmaps4rails.build_markers(locations_with_lat_long) do |course_location, marker|
    #   if course_location.latitude != nil && course_location.longitude != nil
    #     marker.lat course_location.latitude
    #     marker.lng course_location.longitude
    #     marker.name course_location.name
    #     marker.infowindow render_to_string(partial: "course_locations/map_info_window", locals: { location: course_location })
    #   end
    # end

    @coordinates_hash = []
    locations_with_lat_long.each do |location|
      @coordinates_hash << {
        lat: location.latitude,
        lng: location.longitude,
        name: location.name,
        infowindow: render_to_string(partial: "course_locations/map_info_window", locals: { location: location })
      }
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
      respond_to do |format|
        format.html { redirect_to school_course_locations_path(@school) }
        format.js
      end
    else
      respond_to do |format|
        format.html { render 'course_locations#show' }
        format.js
      end
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
      respond_to do |format|
        format.html { redirect_to school_course_locations_path(@school) }
        format.js
      end
    else
      respond_to do |format|
        format.html { redirect_to school_course_locations_path(@school) }
        format.js
      end
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
