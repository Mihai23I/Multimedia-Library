require 'test_helper'

class Administrator::PhysicalVideosControllerTest < ActionController::TestCase
  setup do
    @physical_video = physical_videos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:physical_videos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create physical_video" do
    assert_difference('PhysicalVideo.count') do
      post :create, physical_video: { dubbed: @physical_video.dubbed, format: @physical_video.format, is_3d: @physical_video.is_3d, other_information: @physical_video.other_information, physical_item_id: @physical_video.physical_item_id, resolution: @physical_video.resolution, sound: @physical_video.sound }
    end

    assert_redirected_to administrator_physical_video_path(assigns(:physical_video))
  end

  test "should show physical_video" do
    get :show, id: @physical_video
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @physical_video
    assert_response :success
  end

  test "should update physical_video" do
    patch :update, id: @physical_video, physical_video: { dubbed: @physical_video.dubbed, format: @physical_video.format, is_3d: @physical_video.is_3d, other_information: @physical_video.other_information, physical_item_id: @physical_video.physical_item_id, resolution: @physical_video.resolution, sound: @physical_video.sound }
    assert_redirected_to administrator_physical_video_path(assigns(:physical_video))
  end

  test "should destroy physical_video" do
    assert_difference('PhysicalVideo.count', -1) do
      delete :destroy, id: @physical_video
    end

    assert_redirected_to administrator_physical_videos_path
  end
end
