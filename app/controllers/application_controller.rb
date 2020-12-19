class ApplicationController < ActionController::Base
 before_action :configure_permitted_parameters, if: :devise_controller?


  def after_sign_in_path_for(resource)
    if current_admin
      flash[:notice] = "ログイン"
      admin_path
    end
  end

 protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:id, :last_name, :first_name, :last_name_kana, :_name_kana, :email,:postal_code, :address, :telephone_number, :is_deleted])
  end
end
