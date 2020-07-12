class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) << :name
  end

  def after_sign_in_path_for(_resource_or_scope)
    rails_admin_url
  end

  def after_sign_out_path_for(_resource_or_scope)
    new_user_session_url
  end
end
