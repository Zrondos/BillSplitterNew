class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

 protected

  def configure_permitted_parameters
    attributes = [:first_name, :last_name,:payment_method]
    devise_parameter_sanitizer.permit(:sign_up, keys: attributes)
    devise_parameter_sanitizer.permit(:account_update, keys: attributes)
  end

  
  
  # def configure_permitted_parameters
  #   update_attrs = [:first_name, :last_name, :payment_method, :password, :password_confirmation, :current_password]
  #   devise_parameter_sanitizer.permit :account_update, keys: update_attrs
  # end
end