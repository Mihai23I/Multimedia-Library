class VideosController < ApplicationController
  def index
    #@videos = Video.all.shuffle&.paginate(page: params[:page])
  end

  def show
    @video = Video.find(params[:id])
  end
end
