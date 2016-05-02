class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  include UsersHelper

  # Confirms a logged-in user.
  def confirm_user
    if !logged_in?
      flash[:danger] = "Please log in or sign up."
      redirect_to new_user_registration_path
    elsif !admin_user?
      flash[:danger] = "You do not have sufficent user rights. Please contact website admin to be granted access."
      redirect_to root_url
    end
  end
end
