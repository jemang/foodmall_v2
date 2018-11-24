module CustomDevise
  extend ActiveSupport::Concern

  included do
    before_action :get_permit
    before_action :authenticate_user!
    before_action :configure_permitted_parameters, if: :devise_controller?
  end

  private

  def after_sign_in_path_for(resource_or_scope)
    root_path
  end

  def after_sign_out_path_for(resource_or_scope)
    new_user_session_path
  end

  protected
    
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:username, :email, :password, :password_confirmation])
    devise_parameter_sanitizer.permit(:sign_in, keys: [:login, :password, :password_confirmation])
    devise_parameter_sanitizer.permit(:account_update, keys: [:username, :email, :password, :password_confirmation, :current_password])
  end

  def get_permit
    owner = "Jemang"
    unless ENV["PERMISSION_USED"] == owner
      # raise ActionController::RoutingError.new('Not Found')
      render file: "#{Rails.root}/public/404.html", layout: false, status: 404
    end
  end
  
end