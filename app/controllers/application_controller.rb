class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :set_current_user

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

  def set_current_user
    User.current = current_user
  end

  rescue_from CanCan::AccessDenied do |exception|
    respond_to do |format|
      format.json { head :forbidden }
      format.html { redirect_to admin_path, alert: exception.message }
    end
  end

  private

  def search_on_wikipedia(subject=nil)
    theme = extract_theme

    result = if theme.nil?
               Consulter::Wikipedia.new(subject).call
             else
               Consulter::Wikipedia.new(theme).call
             end

    if result[:success?]
      Rails.logger.info(wikipedia_consulter_formatted_response(result[:payload]))
      return wikipedia_consulter_formatted_response(result[:payload])
    else
      Rails.logger.info(result[:error])
      return 'Sorry an error occured'
    end
  end

  def search_on_google(subject=nil)
    theme = extract_theme

    result = if theme.nil?
               Consulter::Google.new(subject).call
             else
               Consulter::Google.new(theme).call
             end

    if result[:success?]
      Rails.logger.info(google_consulter_formatted_response(result[:payload]))
      return google_consulter_formatted_response(result[:payload])
    else
      Rails.logger.info(result[:error])
      return  "Sorry an error occured #{result[:error]}"
    end
  end

  def check_weather(location_provided_by_whatsapp=nil)
    location_provided_by_other_source = if params.keys.include?(:queryResult)
                                          params[:queryResult][:parameters]['location']
                                        end

    result = if location_provided_by_other_source.nil?
               Consulter::Weather.new(location_provided_by_whatsapp).call
             else
               Consulter::Weather.new(location_provided_by_other_source).call
             end

    if result[:success?]
      Rails.logger.info(weather_checker_formatted_response(result[:payload]))
      weather_checker_formatted_response(result[:payload])
    else
      Rails.logger.info(result[:error])
      'Sorry an error occured'
    end
  end

  def extract_theme
    if params.keys.include?(:queryResult)
      params[:queryResult][:parameters]['theme']
    end
  end

  def wikipedia_consulter_formatted_response(payload)
    if payload.text.present?
      "#{payload.text.slice(0, 150)}...\n complete article: #{payload.fullurl}"
    else
      "I didn't find anything related :("
    end
  end

  def google_consulter_formatted_response(payload)
    if payload.present?
      payload
    else
      "I didn't find anything related :("
    end
  end

  def weather_checker_formatted_response(payload)
    "Here is the weather data for this location:\n#{payload}"
  end
end
