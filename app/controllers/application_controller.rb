class ApplicationController < ActionController::Base
  include SessionsService
  include ApplicationHelper
  before_action :add_application_name

  def add_application_name
    @application_name = GlobalSetting.first.application_name
  end
end
