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
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end
end
