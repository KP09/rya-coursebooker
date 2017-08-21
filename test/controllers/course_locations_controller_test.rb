require 'test_helper'

class CourseLocationsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get course_locations_index_url
    assert_response :success
  end

  test "should get show" do
    get course_locations_show_url
    assert_response :success
  end

  test "should get new" do
    get course_locations_new_url
    assert_response :success
  end

  test "should get create" do
    get course_locations_create_url
    assert_response :success
  end

  test "should get edit" do
    get course_locations_edit_url
    assert_response :success
  end

  test "should get update" do
    get course_locations_update_url
    assert_response :success
  end

  test "should get destroy" do
    get course_locations_destroy_url
    assert_response :success
  end

end
