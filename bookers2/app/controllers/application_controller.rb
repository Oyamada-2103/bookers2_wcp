class ApplicationController < ActionController::Base

  before_action :authenticate_user!,except: [:top, :about]

  # 2章で追加。deviceのアクション
  before_action :configure_permitted_parameters, if: :devise_controller?
  # devise利用の機能（ユーザ登録、ログイン認証など）が使われる場合、その前にconfigure_permitted_parametersが実行されます。


  def after_sign_in_path_for(resource)
    user_path(current_user.id)
    # , notice: 'Welcome! You have signed up successfully.'
    # user_path 使いたい
  end

  protected
  # privateと違いprotectedは呼び出された他のコントローラからも参照できます。
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:email])
  end


end
