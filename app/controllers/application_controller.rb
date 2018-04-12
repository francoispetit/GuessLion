class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:email, :password, :first_name, :last_name, :avatar])
      devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name, :linkedin_url, :twitter_url, :fun_fact_one, :isfemale, :email, :password, :current_password, :avatar, :dev, :growth, :sales, :product])
  end


end
