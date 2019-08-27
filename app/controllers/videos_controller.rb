class VideosController < ApplicationController
  def index
    @videos = Video.all.search_name(params[:name])
    @videos = @videos.order(updated_at: :desc).page params[:page]
  end

  def show
    @video = Video.find(params[:id])
    @youtube_video = youtube_embed(@video.trailer_url) unless @video.trailer_url.blank?
  end

  private

  def youtube_embed(youtube_url)
    uri = URI(youtube_url)
    params = CGI.parse(uri.query)

    "https://www.youtube.com/embed/#{params["v"].first}"
  end
end
