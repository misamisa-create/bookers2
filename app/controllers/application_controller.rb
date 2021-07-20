class ApplicationController < ActionController::Base
  before_action :authenticate_user!,except: [:top,:about]
  before_action :configue_permitted_parameters,if: :devise_controller?
  # フラッシュメッセージ
  add_flash_types :success, :info, :warning, :danger

  protected

  def configue_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up,keys:[:email])
  end

  def after_sign_in_path_for(resource)
    user_path(current_user)
  end
end
