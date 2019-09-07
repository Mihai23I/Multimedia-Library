class Administrator::PhysicalItemsController < ApplicationController
  before_action :set_physical_item, only: [:show, :edit, :update, :destroy]

  # GET /administrator/physical_items
  def index
    @physical_items = PhysicalItem.all
  end

  # GET /administrator/physical_items/1
  def show
  end

  # GET /administrator/physical_items/new
  def new
    @physical_item = PhysicalItem.new
  end

  # GET /administrator/physical_items/1/edit
  def edit
  end

  # POST /administrator/physical_items
  def create
    @physical_item = PhysicalItem.new(physical_item_params)

    if @physical_item.save
      redirect_to [:administrator, @physical_item], notice: 'Physical item was successfully created.'
    else
      render action: 'new'
    end
  end

  # PATCH/PUT /administrator/physical_items/1
  def update
    if @physical_item.update(physical_item_params)
      redirect_to [:administrator, @physical_item], notice: 'Physical item was successfully updated.'
    else
      render action: 'edit'
    end
  end

  # DELETE /administrator/physical_items/1
  def destroy
    @physical_item.destroy
    redirect_to administrator_physical_items_url, notice: 'Physical item was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_physical_item
      @physical_item = PhysicalItem.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def physical_item_params
      params.require(:physical_item).permit(:id, :item_id, :location_id, :category)
    end
end
