class ApplicationController < ActionController::Base
  # Standard Rails CSRF protection
  protect_from_forgery with: :exception

  # Sets permitted parameters for Devise sign up
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  # Method for Devise sign up
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:username, :first_name, :last_name])
  end
end
