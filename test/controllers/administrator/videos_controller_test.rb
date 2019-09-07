require 'test_helper'

class Administrator::VideosControllerTest < ActionController::TestCase
  setup do
    @video = videos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:videos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create video" do
    assert_difference('Video.count') do
      post :create, video: { actors: @video.actors, awards: @video.awards, category: @video.category, director: @video.director, genres: @video.genres, imdb_rating: @video.imdb_rating, imdb_url: @video.imdb_url, item_id: @video.item_id, language: @video.language, poster_url: @video.poster_url, rated: @video.rated, released: @video.released, trailer_url: @video.trailer_url, writer: @video.writer, year: @video.year }
    end

    assert_redirected_to administrator_video_path(assigns(:video))
  end

  test "should show video" do
    get :show, id: @video
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @video
    assert_response :success
  end

  test "should update video" do
    patch :update, id: @video, video: { actors: @video.actors, awards: @video.awards, category: @video.category, director: @video.director, genres: @video.genres, imdb_rating: @video.imdb_rating, imdb_url: @video.imdb_url, item_id: @video.item_id, language: @video.language, poster_url: @video.poster_url, rated: @video.rated, released: @video.released, trailer_url: @video.trailer_url, writer: @video.writer, year: @video.year }
    assert_redirected_to administrator_video_path(assigns(:video))
  end

  test "should destroy video" do
    assert_difference('Video.count', -1) do
      delete :destroy, id: @video
    end

    assert_redirected_to administrator_videos_path
  end
end
