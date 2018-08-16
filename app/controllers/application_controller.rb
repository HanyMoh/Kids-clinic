class ApplicationController < ActionController::Base


  before_action :authenticate_user!
protect_from_forgery with: :exception
before_action :configure_permitted_parameters, if: :devise_controller?

protected

rescue_from CanCan::AccessDenied do |_exception|
  redirect_to root_path, alert: "ليس هناك صلاحية"
end

def configure_permitted_parameters
  devise_parameter_sanitizer.permit(:sign_up, keys: [:email])
  devise_parameter_sanitizer.permit(:sign_in, keys: [:email])
  devise_parameter_sanitizer.permit(:account_update, keys: [:email, :password, :password_confirmation, :current_password])
end
end
