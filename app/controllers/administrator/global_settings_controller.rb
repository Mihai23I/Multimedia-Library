class Administrator::GlobalSettingsController < AdminsController
  before_action :set_global_setting, only: %i[edit update]

  def edit; end

  def update
    if @global_setting.update(global_setting_params)
      flash[:success] = 'Global setting was successfully updated.'
      render action: 'edit'
    else
      render action: 'edit'
    end
  end

  private

  def set_global_setting
    @global_setting = GlobalSetting.find(params[:id])
  end

  def global_setting_params
    params.require(:global_setting).permit(:application_name, :maximum_days_for_burrowing, :maximum_items_per_client)
  end
end
