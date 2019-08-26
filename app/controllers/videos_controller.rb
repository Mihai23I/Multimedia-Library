class VideosController < ApplicationController
  def index
    @videos = Video.all.order('random()')
  end

  def show
    @video = Video.find(params[:id])
  end
end
