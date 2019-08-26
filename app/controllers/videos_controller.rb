class VideosController < ApplicationController
  def index
    @videos = Video.all.order(updated_at: :desc).page params[:page]
  end

  def show
    @video = Video.find(params[:id])
  end
end
