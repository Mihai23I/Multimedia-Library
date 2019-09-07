class Administrator::GlobalSettingsController < AdminsController
  before_action :set_global_setting, only: [:show, :edit, :update, :destroy]

  # GET /administrator/global_settings
  def index
    @global_settings = GlobalSetting.all
  end

  # GET /administrator/global_settings/1
  def show
  end

  # GET /administrator/global_settings/new
  def new
    @global_setting = GlobalSetting.new
  end

  # GET /administrator/global_settings/1/edit
  def edit
  end

  # POST /administrator/global_settings
  def create
    @global_setting = GlobalSetting.new(global_setting_params)

    if @global_setting.save
      redirect_to [:administrator, @global_setting], notice: 'Global setting was successfully created.'
    else
      render action: 'new'
    end
  end

  # PATCH/PUT /administrator/global_settings/1
  def update
    if @global_setting.update(global_setting_params)
      redirect_to [:administrator, @global_setting], notice: 'Global setting was successfully updated.'
    else
      render action: 'edit'
    end
  end

  # DELETE /administrator/global_settings/1
  def destroy
    @global_setting.destroy
    redirect_to administrator_global_settings_url, notice: 'Global setting was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_global_setting
      @global_setting = GlobalSetting.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def global_setting_params
      params.require(:global_setting).permit(:application_name, :maximum_days_for_burrowing, :maximum_items_per_client)
    end
end
