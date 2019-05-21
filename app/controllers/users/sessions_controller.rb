# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController
  def create
      user = User.find_or_create_from_auth(request.env['omniauth.auth'])
      session[:user_id] = user.uid
      flash[:notice] = "ユーザ認証が完了しました。"
      redirect_to root_path
  end

  def destroy
      reset_session
      flash[:notice] = "ログアウトしました。"
      redirect_to root_path
  end
  # before_action :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
end
