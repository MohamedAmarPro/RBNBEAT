class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?
  
  include Pagy::Backend
  
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:pseudo, :photo])

    devise_parameter_sanitizer.permit(:account_update, keys: [:pseudo, :photo])
  end
end
