class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?
  # load_and_authorize_resource

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :role, :company_name])
  end

  def sign_up_params
   params.require(:user).permit(:name, :company_name, :role, :email, :password, :password_confirmation)
  end

  def after_sign_in_path_for(_resource_or_scope)
    rails_admin_url
  end

  def after_sign_out_path_for(_resource_or_scope)
    new_user_session_url
  end

  rescue_from CanCan::AccessDenied do |exception|
    respond_to do |format|
      format.json { head :forbidden }
      format.html { redirect_to admin_path, alert: exception.message }
    end
  end
end
