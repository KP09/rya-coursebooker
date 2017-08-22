class ApplicationController < ActionController::Base
  # Standard Rails CSRF protection
  protect_from_forgery with: :exception

  # Sets permitted parameters for Devise sign up
  before_action :configure_permitted_parameters, if: :devise_controller?

  # Pundit for user authorization
  include Pundit

  # Pundit: white-list approach.
  after_action :verify_authorized, except: :index, unless: :skip_pundit?
  after_action :verify_policy_scoped, only: :index, unless: :skip_pundit?

  # PROTECTED METHODS
  protected

  # Method for Devise sign up
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:username, :first_name, :last_name])
  end

  # PRIVATE METHODS
  private

  # Method to determine whether to skip pundit authorization or not
  def skip_pundit?
    devise_controller? || params[:controller] =~ /(^(rails_)?admin)|(^pages$)/
  end
end
