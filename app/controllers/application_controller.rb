class ApplicationController < ActionController::Base
 before_action :configure_permitted_parameters, if: :devise_controller?

 protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:id, :last_name, :first_name, :last_name_kana, :_name_kana, :postal_code, :address, :telephone_number, :is_deleted])
  end
end
