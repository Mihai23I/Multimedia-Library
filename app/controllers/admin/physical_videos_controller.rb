class Admin::PhysicalVideosController < ApplicationController
  def new
    @item_id = Item.find(params[:item_id])
  end
end
