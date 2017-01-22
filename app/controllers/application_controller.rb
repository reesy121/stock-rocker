class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  include UsersHelper
 
 private
  
  def require_signin
    unless user_signed_in?
      flash[:danger] = "Please log in or sign up."
      redirect_to new_user_registration_path
    end
  end

  def require_admin
    unless admin_user?
      flash[:danger] = "You do not have the sufficent rights"
      redirect_to root_url
    end
  end

end
