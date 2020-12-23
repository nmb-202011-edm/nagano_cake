class ApplicationController < ActionController::Base
 before_action :configure_permitted_parameters, if: :devise_controller?

  def after_sign_in_path_for(resource)
    if customer_signed_in?
      flash[:notice] = "ログイン"
      root_path(resource)
    else
      flash[:notice] = "管理者ログイン"
      admin_path
    end
  end

  def after_sign_out_path_for(resource)
    root_path
  end

  private
    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:id, :last_name, :first_name, :last_name_kana, :first_name_kana, :email,:postal_code, :address, :telephone_number, :is_deleted])
    end
end
