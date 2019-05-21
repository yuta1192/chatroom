class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  protect_from_forgery with: :exception
  helper_method :current_user, :logged_in?, :authenticate

  private

  def current_user
    return unless session[:user_id]
    @current_user ||= User.find_by(uid: session[:user_id])
  end

  def logged_in?
    !!session[:user_id]
  end

  def authenticate
    return if logged_in?
    redirect_to root_path, alert: "ログインしてください"
  end

  protected

    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:username, :email])
      devise_parameter_sanitizer.permit(:sign_in, keys: [:username, :email])
      devise_parameter_sanitizer.permit(:account_update, keys: [:username, :email, :avatar])
    end
end
