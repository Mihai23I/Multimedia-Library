class PhysicalVideosController < ApplicationController
  def index
    @physical_videos = PhysicalVideo.joins(:physical_item).where('physical_items.item_id = ?', params[:item_id]).page params[:page]
    @item = Item.find(params[:item_id])
  end
end
