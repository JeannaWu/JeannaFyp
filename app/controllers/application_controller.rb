class ApplicationController < ActionController::Base
 require 'will_paginate/array'
 include CanCan::ControllerAdditions
 rescue_from CanCan::AccessDenied do |exception|
    redirect_to main_app.root_path, :alert => exception.message
  end
	protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    #devise_parameter_sanitizer.for(:sign_up) << :name
    #devise_parameter_sanitizer.for(:account_update) << :name

    #devise_parameter_sanitizer.for(:sign_up) << :gender
    #devise_parameter_sanitizer.for(:account_update) << :gender

    #devise_parameter_sanitizer.for(:sign_up) << :avatar
    #devise_parameter_sanitizer.for(:account_update) << :avatar
     devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:name, :email, :password) }
     devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:name, :email, :password, :current_password, :gender, :password_confirmation,:avatar) }
  end
end
