class PhysicalVideosController < ApplicationController
  def index
    @physical_videos = PhysicalVideo.all
                      .filter_location(params[:location_id]&.first)
                      .filter_format(params[:format]&.first)
                      .filter_resolution(params[:resolution]&.first)
                      .filter_is_3d(params[:is_3d]&.first)
    @physical_videos = @physical_videos.joins(:physical_item).where('physical_items.item_id = ?', params[:item_id]).page params[:page]
    @item = Item.find(params[:item_id])
  end
end
