class Administrator::ItemsController < AdminsController
  before_action :set_item, only: [:show, :edit, :update, :destroy]

  # GET /administrator/items
  def index
    @q = Item.ransack(params[:q])
    @items = @q.result.order(updated_at: :desc).page(params[:page])
  end

  # GET /administrator/items/1
  def show
  end

  # GET /administrator/items/new
  def new
    @item = Item.new
  end

  # GET /administrator/items/1/edit
  def edit
  end

  # POST /administrator/items
  def create
    @item = Item.new(item_params)

    if @item.save
      redirect_to [:administrator, @item], notice: 'Item was successfully created.'
    else
      render action: 'new'
    end
  end

  # PATCH/PUT /administrator/items/1
  def update
    if @item.update(item_params)
      redirect_to [:administrator, @item], notice: 'Item was successfully updated.'
    else
      render action: 'edit'
    end
  end

  # DELETE /administrator/items/1
  def destroy
    @item.destroy
    redirect_to administrator_items_url, notice: 'Item was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_item
      @item = Item.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def item_params
      params.require(:item).permit(:name)
    end
end
