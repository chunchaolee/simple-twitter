class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  # 請參考 Devise 文件自訂表單後通過 Strong Parameters 的方法
  # https://github.com/plataformatec/devise#strong-parameters
  # 注意有 sign_up 和 account_update 兩種參數要處理

  # 確認使用者登入
  before_action :authenticate_user!


  # 加上自訂欄位name到Devise的註冊和編輯頁面
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
    end

end
