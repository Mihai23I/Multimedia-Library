class VideosController < ApplicationController
  def index
    @videos = Video.all.search_name(params[:name])
                       .filter_year(params[:year])
                       .search_genre(params[:genre])
                       .search_actors(params[:actors])
                       .filter_location(params[:locations]&.first)
    @locations = params[:locations]
    @videos = @videos.order(updated_at: :desc).page params[:page]
    flash[:warning] = 'Niciun videoclip nu corespunde filtrarii' if @videos.blank?
  end

  def show
    @video = Video.find(params[:id])
    @youtube_video = youtube_embed(@video.trailer_url) unless @video.trailer_url.blank?
  end

  private

  def filter_location(videos, location_id)
    return videos if location_id.blank?

    videos_filtered = {}
    videos.each do |video|
      video.item.physical_items.each do |physical_item|
        videos_filtered.push(video) if physical_item.locations.find_by(location_id: location_id)
      end
    end
    videos_filtered.uniq
  end

  def youtube_embed(youtube_url)
    uri = URI(youtube_url)
    params = CGI.parse(uri.query)

    "https://www.youtube.com/embed/#{params["v"].first}"
  end
end
