class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  def after_sign_in_path_for(resource)
     customers_mypage_path(resource)
  end

  def after_sign_up_path_for(resource)
     about_path
  end

  # protectedは呼び出された他のコントローラからも参照することができる
  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys:[:name, :first_name_kana, :last_name_kana, :first_name, :last_name, :post_code, :phone_number, :address ])
  end
end
# configure_permitted_parametersメソッドでは、devise_parameter_sanitizer.permitメソッドを使うことで
# ユーザー登録(sign_up)の際に、ユーザー名等のデータ操作を許可している