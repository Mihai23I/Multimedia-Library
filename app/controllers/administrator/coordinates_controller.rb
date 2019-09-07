class Administrator::CoordinatesController < AdminsController
  before_action :set_coordinate, only: [:show, :edit, :update, :destroy]

  # GET /administrator/coordinates
  def index
    @coordinates = Coordinate.all
  end

  # GET /administrator/coordinates/1
  def show
  end

  # GET /administrator/coordinates/new
  def new
    @coordinate = Coordinate.new
  end

  # GET /administrator/coordinates/1/edit
  def edit
  end

  # POST /administrator/coordinates
  def create
    @coordinate = Coordinate.new(coordinate_params)

    if @coordinate.save
      redirect_to [:administrator, @coordinate], notice: 'Coordinate was successfully created.'
    else
      render action: 'new'
    end
  end

  # PATCH/PUT /administrator/coordinates/1
  def update
    if @coordinate.update(coordinate_params)
      redirect_to [:administrator, @coordinate], notice: 'Coordinate was successfully updated.'
    else
      render action: 'edit'
    end
  end

  # DELETE /administrator/coordinates/1
  def destroy
    @coordinate.destroy
    redirect_to administrator_coordinates_url, notice: 'Coordinate was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_coordinate
      @coordinate = Coordinate.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def coordinate_params
      params.require(:coordinate).permit(:id, :longitude, :latitude)
    end
end
