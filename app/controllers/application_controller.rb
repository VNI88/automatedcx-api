class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  protect_from_forgery with: :exception
  include SessionsHelper

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) << :name
  end

  def authorize
    unless logged_in?
      redirect_to root_url
    end
  end

  def correct_user?
    @user = User.find(params[:id])
    unless current_user == @user
      redirect_to users_path
    end
  end
end
