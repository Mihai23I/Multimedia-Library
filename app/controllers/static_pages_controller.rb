class StaticPagesController < ApplicationController
  def home
  end

  def redirect_to_videos
    redirect_to videos_url
  end
end
