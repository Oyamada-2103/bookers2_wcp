class ApplicationController < ActionController::Base
  
  before_action :authenticate_user!,except: [:top]

  # 2章で追加。deviceのアクション
  before_action :configure_permitted_parameters, if: :devise_controller?
  # devise利用の機能（ユーザ登録、ログイン認証など）が使われる場合、その前にconfigure_permitted_parametersが実行されます。
  protected
  # privateと違いprotectedは呼び出された他のコントローラからも参照できます。
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end


end
