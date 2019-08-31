class Admin::LocationsController < AdminsController
  def new
    @location = Location.new()
  end

  def create
    @location = Location.new(location_params)
    if @location.save
      flash[:success] = 'Locatia a fost adaugata'
      redirect_to locations_url
    else
      flash.now[:danger] = 'Locatia nu a fost adaugat'
      render 'new'
    end
  end

  def edit
  end

  def update
  end

  private
  def location_params
    params.require(:location).permit(:name, :address, :schedule, :alternative_contact)
  end
end
