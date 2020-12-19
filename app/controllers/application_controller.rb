class ApplicationController < ActionController::Base
 before_action :configure_permitted_parameters, if: :devise_controller?

   # 新規登録後のリダイレクト先をマイページへ
  def after_sign_in_path_for(resource)
    if current_admin
      flash[:notice] = "ログイン"
      admin_path  #　指定したいパスに変更
    # else
    #   flash[:notice] = "新規登録完了しました。"
    #   new_profile_path  #　指定したいパスに変更
    end
  end

  # def after_sign_out_path_for(resource)
  #   if current_admin
  #     flash[:notice] = "ログアウト"
  #     admin_path  #　指定したいパスに変更
  #   end
  # end


 protected

  def configure_permitted_parameters
<<<<<<< HEAD
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :kana_first_name, :kana_last_name,
                :email, :postal_code, :residence, :phone_number])
=======
    devise_parameter_sanitizer.permit(:sign_up, keys: [:last_name, :first_name, :last_name_kana, :_name_kana, :postal_code, :address, :telephone_number, :is_deleted])
>>>>>>> develop
  end
end
