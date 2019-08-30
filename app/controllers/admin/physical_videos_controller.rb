class Admin::PhysicalVideosController < ApplicationController
  def new
    @item_id = Item.find(params[:item_id])
    @physical_video = PhysicalVideo.new
  end

  def create
  end

  def edit
  end

  def update
  end
end
