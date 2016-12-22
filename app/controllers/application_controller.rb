class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by using :null_session
  protect_from_forgery with: :null_session

  rescue_from CanCan::AccessDenied do |exception|
    # redirect_to :back, alert: exception.message
    redirect_to main_app.root_path, :alert => exception.message
  end
  
  include DeviseTokenAuth::Concerns::SetUserByToken
  before_action :configure_permitted_parameters, if: :devise_controller?
  respond_to :json

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) << :favorite_color
    devise_parameter_sanitizer.for(:account_update) << :favorite_color
    devise_parameter_sanitizer.for(:account_update) << :nickname
  end
end
