class Administrator::CitiesController < AdminsController
  before_action :set_city, only: [:show, :edit, :update, :destroy]

  # GET /administrator/cities
  def index
    @cities = City.all
  end

  # GET /administrator/cities/1
  def show
  end

  # GET /administrator/cities/new
  def new
    @city = City.new
  end

  # GET /administrator/cities/1/edit
  def edit
  end

  # POST /administrator/cities
  def create
    @city = City.new(city_params)

    if @city.save
      redirect_to [:administrator, @city], notice: 'City was successfully created.'
    else
      render action: 'new'
    end
  end

  # PATCH/PUT /administrator/cities/1
  def update
    if @city.update(city_params)
      redirect_to [:administrator, @city], notice: 'City was successfully updated.'
    else
      render action: 'edit'
    end
  end

  # DELETE /administrator/cities/1
  def destroy
    @city.destroy
    redirect_to administrator_cities_url, notice: 'City was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_city
      @city = City.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def city_params
      params.require(:city).permit(:id, :name, :coordinate_id, :country)
    end
end
