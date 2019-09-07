class Administrator::LocationsController < AdminsController
  before_action :set_location, only: [:show, :edit, :update, :destroy]

  # GET /administrator/locations
  def index
    @locations = Location.all
  end

  # GET /administrator/locations/1
  def show
  end

  # GET /administrator/locations/new
  def new
    @location = Location.new
  end

  # GET /administrator/locations/1/edit
  def edit
  end

  # POST /administrator/locations
  def create
    @location = Location.new(location_params)

    if @location.save
      redirect_to [:administrator, @location], notice: 'Location was successfully created.'
    else
      render action: 'new'
    end
  end

  # PATCH/PUT /administrator/locations/1
  def update
    if @location.update(location_params)
      redirect_to [:administrator, @location], notice: 'Location was successfully updated.'
    else
      render action: 'edit'
    end
  end

  # DELETE /administrator/locations/1
  def destroy
    @location.destroy
    redirect_to administrator_locations_url, notice: 'Location was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_location
      @location = Location.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def location_params
      params.require(:location).permit(:name, :address, :schedule, :alternative_contact, :coordinate_id, :city_id)
    end
end
