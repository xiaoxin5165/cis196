class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :logged_in?, :current_user, :get_owner

  def logged_in?
    session[:user_id]
  end

  def current_user
    User.find(session[:user_id]) if logged_in?
  end
end
