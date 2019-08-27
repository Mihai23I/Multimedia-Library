class LocationsController < ApplicationController
  def index
    @locations = Location.all.order(:created_at).page params[:page]
  end
end
