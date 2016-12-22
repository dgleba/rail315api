class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by using :null_session
  # protect_from_forgery with: :null_session
  protect_from_forgery with: :null_session, :if => Proc.new { |c| c.request.format == 'application/json' }

  
  include DeviseTokenAuth::Concerns::SetUserByToken
  before_action :configure_permitted_parameters, if: :devise_controller?
  respond_to :json

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) << :favorite_color
    devise_parameter_sanitizer.for(:account_update) << :favorite_color
    devise_parameter_sanitizer.for(:account_update) << :nickname
  end
  
 
  # From https://github.com/Sjors/devise-token-api-demo David Gleba 2016-12-22
  # Apply strong_parameters filtering before CanCan authorization
  # See https://github.com/ryanb/cancan/issues/571#issuecomment-10753675
  # before_filter do
    # resource = controller_name.singularize.to_sym
    # method = "#{resource}_params"
    # params[resource] &&= send(method) if respond_to?(method, true)
  # end

  rescue_from CanCan::AccessDenied do |exception|
    respond_to do |format|
      format.json { head :forbidden, content_type: 'text/html' }
      format.html { redirect_to main_app.root_url, notice: exception.message }
      format.js   { head :forbidden, content_type: 'text/html' }
    end
  end
 
end
